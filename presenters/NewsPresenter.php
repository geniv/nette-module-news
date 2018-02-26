<?php declare(strict_types=1);

namespace App\Presenters;

use App\Model\News;
use Nette\Utils\Strings;


/**
 * Class NewsPresenter
 *
 * @author  geniv
 * @package App\Presenters
 */
class NewsPresenter extends ModulesBasePresenter
{
    /** @var News @inject */
    public $newsModel;

    private $offset = 0;
    private $itemsPerPage;  // count items per offset


    /**
     * Startup.
     *
     * @throws \Nette\Application\AbortException
     */
    protected function startup()
    {
        parent::startup();

        $this->redirect(':Homepage:');  // default redirect for not use this presenter

        $this->itemsPerPage = $this->context->parameters['news']['itemsPerPage'];
    }


    /**
     * Render default.
     */
    public function renderDefault()
    {
        $this['breadCrumb']->addLink('breadcrumb-news', null, 'fa fa-newspaper-o');

        $this->template->offset = $this->offset;

//        $this->newsModel->getListHomepageNews();

        $news = $this->newsModel->getList();
        $countNews = count($news);

        $this->template->news = $news->limit($this->itemsPerPage)->offset($this->offset);

        $this->template->showMore = true;
        if ($this->offset + $this->itemsPerPage >= $countNews) {
            $this->template->showMore = false;
        }
    }


    /**
     * Handler more.
     *
     * @param $offset
     */
    public function handleMore($offset)
    {
        $this->offset = $offset + $this->itemsPerPage;

        if ($this->isAjax()) {
            $this->redrawControl('news');
            $this->redrawControl('more');
        }
    }


    /**
     * Render detail.
     *
     * @param $id
     * @throws \Nette\Application\AbortException
     */
    public function renderDetail($id)
    {
        $this['breadCrumb']->addLink('breadcrumb-news', '//:News:', 'fa fa-newspaper-o');

        $detail = $this->newsModel->getDetail($id);
        if ($detail) {
            $this['breadCrumb']->addLink('breadcrumb-news-' . Strings::webalize($detail->title), null, 'fa fa-newspaper-o');

            $this->template->detail = $detail;
            $this->template->gallery = $this->newsModel->getListNewsGallery($id);
        } else {
            $this->redirect('News:');
        }
    }
}
