<?php declare(strict_types=1);

namespace App\Model;

use Dibi\Connection;
use Dibi\Fluent;
use Dibi\Row;
use Locale\ILocale;
use Nette\DI\Container;
use Nette\SmartObject;


/**
 * Class News
 *
 * @author  geniv
 * @package App\Model
 */
class News
{
    use SmartObject;

    // define constant table names
    const
        TABLE_NAME = 'news',
        TABLE_NAME_HAS_LOCALE = 'news_has_locale',
        TABLE_NAME_GALLERY = 'news_gallery',
        TABLE_NAME_GALLERY_HAS_LOCALE = 'news_gallery_has_locale';

    /** @var string tables name */
    private $tableNews, $tableNewsHasLocale, $tableNewsGallery, $tableNewsGalleryHasLocale;
    /** @var Connection database connection from DI */
    private $connection;
    /** @var int id locale */
    private $idLocale;


    /**
     * News constructor.
     *
     * @param array      $parameters
     * @param Connection $connection
     * @param ILocale    $locale
     * @param Container  $container
     */
    public function __construct(array $parameters, Connection $connection, ILocale $locale, Container $container)
    {
        // define table names
        $this->tableNews = $parameters['tablePrefix'] . self::TABLE_NAME;
        $this->tableNewsHasLocale = $parameters['tablePrefix'] . self::TABLE_NAME_HAS_LOCALE;                  // news has locale
        $this->tableNewsGallery = $parameters['tablePrefix'] . self::TABLE_NAME_GALLERY;                       // gallery news
        $this->tableNewsGalleryHasLocale = $parameters['tablePrefix'] . self::TABLE_NAME_GALLERY_HAS_LOCALE;   // gallery has locale

        $this->connection = $connection;
        $this->idLocale = $locale->getId();
        $container->parameters += $parameters;  // set configure from extension
    }


    /**
     * Get list.
     *
     * @return Fluent
     */
    public function getList(): Fluent
    {
        return $this->connection->select('n.id, nhl.title, nhl.perex,  nhl.description, n.image, n.added, n.visible, n.visible_on_homepage')
            ->from($this->tableNews)->as('n')
            ->leftJoin($this->tableNewsHasLocale)->as('nhl')->on('nhl.id_news=n.id')->and(['nhl.id_locale' => $this->idLocale])
            ->where(['n.visible' => true])
            ->orderBy('n.added')->desc();
    }


    /**
     * Get detail.
     *
     * @param $idNews
     * @return Row|false
     */
    public function getDetail($idNews)
    {
        return $this->getList()
            ->where(['n.id' => $idNews])
            ->fetch();
    }


    /**
     * Get list homepage news.
     *
     * @return Fluent
     */
    public function getListHomepageNews(): Fluent
    {
        return $this->getList()
            ->where(['n.visible_on_homepage' => true]);
    }


    /**
     * Get list new gallery.
     *
     * @param $idNews
     * @return Fluent
     */
    public function getListNewsGallery($idNews): Fluent
    {
        return $this->connection->select('ng.id, ghl.title, ng.id_news, ng.image, ng.added, ng.visible, ng.visible_on_homepage')
            ->from($this->tableNewsGallery)->as('ng')
            ->leftJoin($this->tableNewsGalleryHasLocale)->as('ghl')->on('ghl.id_news_gallery=ng.id')->and(['ghl.id_locale' => $this->idLocale])
            ->where(['ng.id_news' => $idNews, 'ng.visible' => true])
            ->orderBy('ng.position')->asc();
    }
}
