<?php declare(strict_types=1);

namespace NewsModule\Bridges\Nette;

use App\Model\News;
use Nette\DI\CompilerExtension;


/**
 * Class Extension
 *
 * @author  geniv
 * @package NewsModule\Bridges\Nette
 */
class Extension extends CompilerExtension
{
    /** @var array default values */
    private $defaults = [
        'tablePrefix' => null,
        'news'        => [],
    ];


    /**
     * Load configuration.
     */
    public function loadConfiguration()
    {
        $builder = $this->getContainerBuilder();
        $config = $this->validateConfig($this->defaults);

        $builder->addDefinition($this->prefix('model'))
            ->setFactory(News::class, [$config]);
    }
}
