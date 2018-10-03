<main class="main" role="main">

    <section class="section intro">
        <div class="section__layer section__front">
            <div id="introSlider" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <?php use common\models\Category;

                    foreach ($banners as $key => $banner) { ?>
                        <li data-target="#introSlider"
                            data-slide-to="<?= $key ?>" <?= $key === 0 ? 'class="active"' : '' ?>></li>
                    <?php } ?>
                </ol><!-- .carousel-indicators -->
                <?php foreach ($banners as $key => $banner) { ?>
                    <div class="carousel-inner">
                        <div class="carousel-item <?= $key === 0 ? 'active' : '' ?>">
                            <figure class="d-block text-center">
                                <img class="d-inline-block" src="<?= $banner->image ?>" alt="<?= $banner->name ?>">
                            </figure>
                            <div class="carousel-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-4 col-md-5 col-xl-6"></div>
                                        <div class="col-8 col-md-7 col-xl-6 text-right">
                                            <div class="carousel-text-big"><?= $banner->description_big ?></div>
                                            <div class="carousel-text-small"><?= $banner->description_small ?></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </section><!-- .intro -->

    <section class="section products">
        <div class="section__layer section__front">
            <div class="container">
                <!-- Backend decides when to show for mobile or desktop
                // For now its detected by js-script -->
                <div id="products__mobile" class="products__mobile">
                    <nav class="nav products__mobile--tabs">
                        <?php if (!empty($productsPromote)) { ?>
                            <a href="#products__slider--1" class="tab-link show" title="to slider 1">Акция</a>
                        <?php } ?>
                        <?php if (!empty($productsHot)) { ?>
                            <a href="#products__slider--2" class="tab-link" title="to slider 2">Лидеры продаж</a>
                        <?php } ?>
                        <?php if (!empty($productsNew)) { ?>
                            <a href="#products__slider--3" class="tab-link" title="to slider 3">Новинки</a>
                        <?php } ?>
                    </nav><!-- .products__mobile--tabs -->
                    <?php if (!empty($productsPromote)) { ?>
                        <div id="products__slider--1" class="products__slider products__slider--1 active">
                            <?php foreach ($productsPromote as $promote) {
                                echo $this->render('block/main_products_part', ['type' => 'promote', 'item' => $promote]);
                            } ?>
                        </div>
                    <?php } ?>
                    <?php if (!empty($productsHot)) { ?>
                        <div id="products__slider--2" class="products__slider products__slider--2" aria-hidden="true">
                            <?php foreach ($productsHot as $hot) {
                                echo $this->render('block/main_products_part', ['type' => 'hot', 'item' => $hot]);
                            } ?>
                        </div>
                    <?php } ?>
                    <?php if (!empty($productsNew)) { ?>
                        <div id="products__slider--3" class="products__slider products__slider--3" aria-hidden="true">
                            <?php foreach ($productsNew as $new) {
                                echo $this->render('block/main_products_part', ['type' => 'new', 'item' => $new]);
                            } ?>
                        </div>
                    <?php } ?>
                </div><!-- .products__mobile -->
                <div id="products__desktop" class="products__desktop">
                    <nav class="nav nav-tabs nav-fill border">
                        <?php if (!empty($productsPromote)) { ?>
                            <a href="#stocks" class="nav-link active" role="tab" aria-controls="stocks"
                               data-toggle="tab"
                               aria-selected="true">Акция</a>
                        <?php } ?>
                        <?php if (!empty($productsHot)) { ?>
                            <a href="#sales" class="nav-link" role="tab" aria-controls="sales" data-toggle="tab"
                               aria-selected="false">Лидеры продаж</a>
                        <?php } ?>
                        <?php if (!empty($productsNew)) { ?>
                            <a href="#new" class="nav-link" role="tab" aria-controls="new" data-toggle="tab"
                               aria-selected="false">Новинки</a>
                        <?php } ?>
                    </nav><!-- .products__desktop--tabs -->
                    <div class="tab-content">
                        <?php if (!empty($productsPromote)) {
                            $promoteMain = $productsPromote[0];
                            $promoteColumnOne = array_slice($productsPromote, 1, 2);
                            $promoteColumnTwo = array_slice($productsPromote, 3, 2);
                            ?>
                            <div id="stocks" class="tab-pane fade show active" aria-labelledby="stocks-tab">
                                <div class="column column-1">
                                    <?php foreach ($promoteColumnOne as $one) {
                                        echo $this->render('block/main_products_part', ['type' => 'promote', 'item' => $one]);
                                    } ?>
                                </div>
                                <div class="column column-2">
                                    <?= $this->render('block/main_products_part', ['type' => 'promote', 'item' => $promoteMain]); ?>
                                </div>
                                <div class="column column-3">
                                    <?php foreach ($promoteColumnTwo as $two) {
                                        echo $this->render('block/main_products_part', ['type' => 'promote', 'item' => $two]);
                                    } ?>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if (!empty($productsHot)) {
                            $hotMain = $productsHot[0];
                            $hotColumnOne = array_slice($productsHot, 1, 2);
                            $hotColumnTwo = array_slice($productsHot, 3, 2);
                            ?>
                            <div id="sales" class="tab-pane fade" aria-labelledby="sales-tab">
                                <div class="column column-1">
                                    <?php foreach ($hotColumnOne as $one) {
                                        echo $this->render('block/main_products_part', ['type' => 'hot', 'item' => $one]);
                                    } ?>
                                </div>
                                <div class="column column-2">
                                    <?= $this->render('block/main_products_part', ['type' => 'hot', 'item' => $hotMain]); ?>

                                </div>
                                <div class="column column-3">
                                    <?php foreach ($hotColumnTwo as $two) {
                                        echo $this->render('block/main_products_part', ['type' => 'hot', 'item' => $two]);
                                    } ?>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if (!empty($productsNew)) {
                            $newMain = $productsNew[0];
                            $newColumnOne = array_slice($productsNew, 1, 2);
                            $newColumnTwo = array_slice($productsNew, 3, 2);
                            ?>
                            <div id="new" class="tab-pane fade" aria-labelledby="new-tab">
                                <div class="column column-1">
                                    <?php foreach ($newColumnOne as $one) {
                                        echo $this->render('block/main_products_part', ['type' => 'new', 'item' => $one]);
                                    } ?>
                                </div>
                                <div class="column column-2">
                                    <?= $this->render('block/main_products_part', ['type' => 'new', 'item' => $newMain]); ?>

                                </div>
                                <div class="column column-3">
                                    <?php foreach ($newColumnTwo as $two) {
                                        echo $this->render('block/main_products_part', ['type' => 'new', 'item' => $two]);
                                    } ?>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div><!-- .products__desktop -->
            </div>
        </div>
    </section><!-- .products -->

    <section class="section categories1">
        <div class="section__layer section__front">
            <div class="container">
                <div class="h1 text-center">Популярные категории</div>
                <div class="d-xl-flex categories1__slider">
                    <?php foreach ($allCategory as $category) { ?>
                        <div class="card categories1__slide">
                            <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $category->id]) ?>"
                               class="card-img categories1__slide--image" title="<?= $category->name ?>">
                                <img src="<?= $category->banner ?>" alt="<?= $category->name ?>">
                            </a>
                            <div class="card-title h2 categories1__slide--title">
                                <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $category->id]) ?>"
                                   title="<?= $category->name ?>"><?= $category->name ?></a>
                            </div>
                        </div>
                    <?php } ?>
                </div><!-- .categories1__slider -->
            </div>
        </div>
    </section><!-- .categories1 -->

    <section class="section categories2">
        <div class="section__layer section__front">
            <div class="container">
                <div class="d-xl-flex categories2__slider">
                    <?php foreach (array_slice($allCategory, 0, 4) as $cat) {
                        $subCategoryId = Category::getArraySubCatalogId($cat->id, $allCategory);
                        ?>
                        <div class="card categories2__slide">
                            <div class="card-title h2 categories2__slide--title"><?= $cat->name ?></div>
                            <figure class="card-img categories2__slide--image">
                                <img src="/img/parket-1.jpg" alt="1 - полосный">
                            </figure>
                            <div class="card-body categories2__slide--content">
                                <div class="h2"><?= $cat->brief ?></div>
                                <ul>
                                    <?php foreach ($subCategoryId as $subId) {
                                        $catSub = Category::findOne($subId);
                                        ?>
                                        <li>
                                            <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $catSub->id]) ?>"
                                               class="link" title="<?= $catSub->name ?>"><?= $catSub->name ?></a>
                                        </li>
                                    <?php } ?>
                                </ul>
                                <a href="<?= Yii::$app->urlManager->createUrl(['category/view', 'id' => $cat->id]) ?>"
                                   class="arrow-right link-more" title="Смотреть все">
                                    <span class="border-bottom">Смотреть все</span>
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </div>
                        </div>
                    <?php } ?>
                </div><!-- .categories2__slider -->
            </div>
        </div>
    </section><!-- .categories2 -->

    <section class="section manufacturer">
        <div class="section__layer section__front">
            <div class="container">
                <div class="h1">Производители</div>
                <div class="slider manufacturer__slider">
                    <?php foreach ($brands as $brand) { ?>
                        <figure class="manufacturer__slide"><img src="/img/slider1/slide1.jpg" alt="slide 1"></figure>
                    <?php } ?>
                </div>
            </div>
        </div>
    </section><!-- .manufacturer -->

    <section class="section utp">
        <div class="section__layer section__back"></div><!-- .section__back -->
        <div class="section__layer section__front">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg enable-background="new 0 0 512 391" version="1.1" viewBox="0 0 512 391"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <style type="text/css">
                                    .st0 {
                                        fill: #345C04;
                                    }
                                </style>
                                <path class="st0"
                                      d="m256 0c-107.5 0-195 88.5-195 196s87.5 195 195 195 195-87.5 195-195-87.5-196-195-196zm0 331c-74.4 0-135-60.6-135-135s60.6-135 135-135 135 60.6 135 135-60.6 135-135 135z"/>
                                <path class="st0"
                                      d="m206.4 107.9c-0.2 0.4-3.9 1.2-10.9 2.5s-11.9 2.2-14.5 2.7v-14.6c14.6-3.5 24.7-8.8 30.1-15.8h14.6v145.8h-19.3v-120.6z"/>
                                <path class="st0"
                                      d="m264.4 219.1c-5.6-7.3-8.5-17.9-8.5-31.7 0-9.2 1.5-16.6 4.6-22.1s7.5-10.1 13.4-13.7c-10.8-7.2-16.2-18.1-16.2-32.6 0-11.9 2.8-21.1 8.5-27.7 5.6-6.6 14.2-9.9 25.7-9.9 11.4 0 19.9 3.3 25.5 9.9s8.4 15.8 8.4 27.7c0 7.8-1.4 14.3-4.1 19.5-2.8 5.2-6.8 9.6-12.1 13.1 5.9 3.7 10.4 8.3 13.5 13.9 3.1 5.5 4.7 12.8 4.7 22 0 13.7-2.8 24.2-8.5 31.6-5.6 7.4-14.8 11.1-27.4 11.1-12.7-0.1-21.9-3.8-27.5-11.1zm41-11.4c2.5-4.7 3.8-11.4 3.8-19.9 0-7.8-1.4-14.2-4-19.1-2.7-4.9-7.1-7.4-13.2-7.6-6.2 0.1-10.7 2.6-13.5 7.6-2.8 4.9-4.1 11.3-4.1 19.1 0 8.5 1.3 15.2 3.9 19.9s7.2 7.1 13.8 7.1c6.3 0 10.8-2.4 13.3-7.1zm1.5-89.8c0-6.5-1.2-11.7-3.5-15.7s-6.2-5.9-11.4-5.9c-5.3 0-9.2 2-11.6 5.9-2.5 4-3.7 9.2-3.7 15.7 0 7.2 1.1 13.1 3.4 17.7s6.2 7 11.9 7.1c9.9 0 14.9-8.3 14.9-24.8z"/>
                                <path class="st0"
                                      d="m194.5 301.4c2.7 0 4.6-0.7 5.8-2.2 1.2-1.4 2.1-3.8 2.6-7 0.5-3.3 1-8.6 1.4-15.9l1.3-25.1h30.3v57.8h-10.7v-49.7h-10.2l-0.9 17c-0.5 9.3-1.2 16.2-2.3 20.8s-2.8 7.8-5.2 9.7-6 2.8-10.9 2.8h-1.2v-8.2z"/>
                                <path class="st0"
                                      d="m252.3 307.3c-2.5-1.7-4.2-4.2-5.2-7.5s-1.5-7.7-1.5-13v-13.2c0-8 1.2-13.8 3.8-17.5 2.5-3.7 7-5.6 13.4-5.6 4.7 0 8.2 1 10.5 2.9 2.4 1.9 3.9 4.6 4.7 8.1s1.1 8.2 1.1 14.1v4.7h-22.8v11.6c0 3.5 0.5 6.1 1.5 7.6 1 1.6 2.7 2.4 5 2.4s3.8-0.8 4.6-2.4 1.2-4 1.2-7.1v-3.5h10.4v2.2c0 6.1-1.3 10.7-3.9 13.9s-6.7 4.8-12.4 4.8c-4.5 0-8-0.8-10.4-2.5zm16.3-32.8v-5.2c0-3.9-0.4-6.8-1.1-8.4-0.8-1.7-2.4-2.6-4.9-2.6-1.7 0-3 0.4-4 1.2-0.9 0.8-1.5 2.1-1.8 4-0.3 1.8-0.5 4.5-0.5 8v3.1h12.3z"/>
                                <path class="st0" d="M294.9,259.2H284v-8h32.4v8h-10.9V309h-10.7V259.2z"/>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Более 18 лет на рынке</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg enable-background="new 0 0 512 512" version="1.1" viewBox="0 0 512 512"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <style type="text/css">
                                    .st0 {
                                        fill: #345C04;
                                    }
                                </style>
                                <path class="st0"
                                      d="m256 0c-107.5 0-195 88.5-195 196s87.5 195 195 195 195-87.5 195-195-87.5-196-195-196zm0 331c-74.4 0-135-60.6-135-135s60.6-135 135-135 135 60.6 135 135-60.6 135-135 135z"/>
                                <path class="st0"
                                      d="m488.4 439.5-51.4-110.3c-30.5 41.3-74.7 71.8-126 84.7l41.5 89.4c2.5 5.3 7.8 8.7 13.6 8.7h0.7c6-0.3 11.4-4.2 13.4-9.9l23.8-66.1 65.7 23.9c5.7 2.1 12.1 0.5 16.2-4 4-4.4 5-10.9 2.5-16.4z"/>
                                <path class="st0"
                                      d="m75.1 329.2-51.5 110.3c-2.6 5.5-1.6 12 2.5 16.5s10.5 6.1 16.2 4l65.7-24 23.9 66.1c2.1 5.7 7.4 9.6 13.4 9.9h0.7c5.8 0 11.1-3.4 13.6-8.7l41.5-89.4c-51.3-12.9-95.5-43.4-126-84.7z"/>
                                <path class="st0"
                                      d="m199.8 146.5c-0.3 0.4-4.3 1.3-12.1 2.8s-13.2 2.5-16.1 3v-16.2c16.3-3.9 27.4-9.7 33.4-17.6h16.2v162h-21.4v-134z"/>
                                <path class="st0"
                                      d="m263.3 270.2c-6.1-7.9-9.1-19.6-9.1-35.1h21.4c0 9.1 1.2 16.3 3.7 21.8s7.3 8.2 14.5 8.2c5.5 0 9.5-1.6 12.2-4.8s4.4-7.4 5.1-12.7 1.1-12.3 1.1-21.1c0-8.1-0.4-14.6-1.3-19.5s-2.6-8.6-5.2-11.2-6.5-3.9-11.7-3.9c-4.1 0-7.8 1.3-10.9 3.8s-5.5 5.7-7.1 9.6h-18.2v-86.8h69.8v21.4h-50.4l-1.4 44.8c5.7-6 13.5-9 23.4-9 12.4 0 21.2 4.2 26.5 12.7s7.9 20.2 7.9 35.3c0 18.4-3 32.7-9 43s-16.4 15.4-31.2 15.4c-14 0-24-4-30.1-11.9z"/>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Гарантия до 15 лет</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg enable-background="new 0 0 512 512" version="1.1" viewBox="0 0 512 512"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <style type="text/css">
                                    .st0 {
                                        fill: #345C04;
                                    }
                                </style>
                                <path class="st0"
                                      d="m256 0c-107.5 0-195 88.5-195 196s87.5 195 195 195 195-87.5 195-195-87.5-196-195-196zm0 331c-74.4 0-135-60.6-135-135s60.6-135 135-135 135 60.6 135 135-60.6 135-135 135z"/>
                                <path class="st0"
                                      d="m488.4 439.5-51.4-110.3c-30.5 41.3-74.7 71.8-126 84.7l41.5 89.4c2.5 5.3 7.8 8.7 13.6 8.7h0.7c6-0.3 11.4-4.2 13.4-9.9l23.8-66.1 65.7 23.9c5.7 2.1 12.1 0.5 16.2-4 4-4.4 5-10.9 2.5-16.4z"/>
                                <path class="st0"
                                      d="m75.1 329.2-51.5 110.3c-2.6 5.5-1.6 12 2.5 16.5s10.5 6.1 16.2 4l65.7-24 23.9 66.1c2.1 5.7 7.4 9.6 13.4 9.9h0.7c5.8 0 11.1-3.4 13.6-8.7l41.5-89.4c-51.3-12.9-95.5-43.4-126-84.7z"/>
                                <rect class="st0" transform="matrix(.7071 -.7071 .7071 .7071 -99.223 211.57)" x="187.2"
                                      y="162.7" width="37.1" height="125.7"/>
                                <rect class="st0" transform="matrix(.7071 .7071 -.7071 .7071 230.47 -141.55)" x="267.2"
                                      y="119.3" width="37.7" height="176.3"/>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Сертифицированный товар</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg width="512px" height="512px" enable-background="new 0 0 406.783 406.783" version="1.1"
                                 viewBox="0 0 406.78 406.78" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <g fill="#345c04">
                                    <path d="m127.12 256.57c-19.742 0-35.741 15.993-35.741 35.737 0 19.745 15.999 35.738 35.741 35.738 19.749 0 35.744-15.993 35.744-35.738 0-19.744-15.995-35.737-35.744-35.737zm0 51.274c-8.582 0-15.536-6.955-15.536-15.537 0-8.586 6.954-15.537 15.536-15.537 8.583 0 15.542 6.951 15.542 15.537 0 8.582-6.959 15.537-15.542 15.537z"/>
                                    <path d="m315.59 256.57c-19.742 0-35.74 15.993-35.74 35.737 0 19.745 15.998 35.738 35.74 35.738 19.75 0 35.744-15.993 35.744-35.738 0-19.744-15.994-35.737-35.744-35.737zm0 51.274c-8.582 0-15.535-6.955-15.535-15.537 0-8.586 6.953-15.537 15.535-15.537 8.584 0 15.543 6.951 15.543 15.537 0 8.582-6.959 15.537-15.543 15.537z"/>
                                    <path d="m167.33 146.76c0 5.008-4.098 9.105-9.105 9.105h-125.64c-5.008 0-9.104-4.097-9.104-9.105v-5.463c0-5.007 4.097-9.104 9.104-9.104h125.64c5.008 0 9.105 4.097 9.105 9.104v5.463z"/>
                                    <path d="m385.62 200.07c-13.105-3.407-20.604-5.549-25.75-15.487l-17.207-34.839c-5.148-9.938-18.518-18.07-29.707-18.07h-23.535s-3.166 0.066-3.166-3.12v-29.219c0-11.327-6.41-20.595-20.045-20.595h-191.81c-19.521 0-28.789 9.269-28.789 20.595v18.311s0 5.446 5.271 5.446h107.34c10.041 0 18.21 8.168 18.21 18.209v5.463c0 10.041-8.169 18.209-18.21 18.209h-107.34s-5.271-0.438-5.271 5.252v6.297c0 5.008 6.864 5.005 6.864 5.005h72.254c10.041 0 18.21 8.169 18.21 18.209v5.463c0 10.041-8.169 18.209-18.21 18.209h-71.114s-8.004-0.148-8.004 6.225v44.246c0 11.326 9.268 20.595 20.595 20.595h11.376c2.58 0 2.96-1.437 2.96-2.159 0-25.679 20.894-46.568 46.574-46.568 25.682 0 46.575 20.891 46.575 46.568 0 0.725-0.206 2.159 1.767 2.159h91.806c1.82 0 1.746-1.534 1.746-2.159 0-25.679 20.893-46.568 46.574-46.568s46.574 20.891 46.574 46.568c0 0.725-0.018 2.159 1.121 2.159h23.146c11.195 0 20.352-9.157 20.352-20.351v-38.664c1e-3 -32.561-10.28-32.561-21.159-35.389zm-38.727-1.811h-57.928c-2.393 0-2.711-2.33-2.711-2.33v-48.255s-0.135-1.853 2.938-1.853h16.529c9.959 0 21.855 7.236 26.434 16.079l15.312 31c0.645 1.248 1.334 2.356 2.072 3.349 0.544 0.728-0.368 2.01-2.646 2.01z"/>
                                    <path d="m133.84 205.2c0 5.008-4.097 9.105-9.104 9.105h-115.63c-5.008 0-9.104-4.097-9.104-9.105v-5.463c0-5.007 4.097-9.104 9.104-9.104h115.63c5.008 0 9.104 4.097 9.104 9.104v5.463z"/>
                                </g>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Доставка по России</span>
                        </div>
                    </div>
                </div><!-- .row 1 -->
                <div class="row">
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg width="512px" height="512px" enable-background="new 0 0 56.414 56.414" version="1.1"
                                 viewBox="0 0 56.414 56.414" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <g fill="#345c04">
                                    <path d="m1.415 14c0.201 0 0.404-0.061 0.58-0.187 0.204-0.144 20.626-14.404 39.819-0.013 0.442 0.332 1.069 0.243 1.399-0.2 0.332-0.441 0.242-1.068-0.2-1.399-20.348-15.264-41.963-0.169-42.18-0.014-0.449 0.32-0.554 0.945-0.232 1.395 0.195 0.272 0.502 0.418 0.814 0.418z"/>
                                    <path d="m52.917 26.134c-0.479 0.274-0.644 0.886-0.37 1.364 0.192 0.337 4.622 8.332-2.84 15.795-2.741 2.739-9.128 3.895-13.912 1.172-4.812-2.738-6.378-8.497-4.412-16.218 0.137-0.535-0.187-1.08-0.722-1.216-0.537-0.143-1.079 0.187-1.216 0.722-2.98 11.703 2.079 16.583 5.36 18.45 2.143 1.219 4.695 1.809 7.215 1.808 3.501 0 6.935-1.138 9.101-3.304 8.568-8.568 3.214-18.111 3.159-18.207-0.276-0.477-0.884-0.641-1.363-0.366z"/>
                                    <path d="m45.299 0h-14.004l-3.703 3.691c4.301 0.563 8.815 1.979 13.326 4.692 0.704 0.423 1.52 0.665 2.34 0.622 0.719-0.038 1.505 0.157 2.388 0.816 1 0.746 1.721 1.875 1.719 3.122-4e-3 2.167-1.768 3.928-3.936 3.928-1.161 0-2.201-0.509-2.92-1.312-0.37-0.413-0.78-0.796-1.24-1.107-5.967-4.031-12.006-5.236-17.397-5.059l-15.873 15.82 8e-3 8e-3 -6.007 5.992 25.146 25.201 8.56-8.537c-3.076-1.791-9.546-7.264-6.234-20.48 0.357-1.423 1.65-2.492 3.114-2.394 1.936 0.129 3.19 1.95 2.735 3.737-1.748 6.866-0.551 11.702 3.463 13.986 0.458 0.261 0.938 0.476 1.43 0.654l13.269-13.233c-0.314-1.014-0.655-1.627-0.667-1.647-0.829-1.435-0.337-3.27 1.098-4.098 1.437-0.828 3.27-0.337 4.098 1.098 0.016 0.027 0.031 0.057 0.047 0.084l0.356-0.355v-14.14l-11.116-11.089z"/>
                                </g>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Отличные цены</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg enable-background="new 0 0 897.3 897.3" version="1.1" viewBox="0 0 897.3 897.3"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <style type="text/css">
                                    .st0 {
                                        fill: #345C04;
                                    }

                                    .st1 {
                                        fill: #345C04;
                                        stroke: #000000;
                                        stroke-miterlimit: 10;
                                    }
                                </style>
                                <path class="st0"
                                      d="m12.8 127.1c1.8 0 3.7-0.6 5.3-1.7 1.9-1.3 187.2-130.7 361.4-0.1 4 3 9.7 2.2 12.7-1.8s2.2-9.7-1.8-12.7c-184.7-138.6-380.9-1.6-382.8-0.2-4.1 2.9-5 8.6-2.1 12.7 1.7 2.4 4.5 3.8 7.3 3.8z"/>
                                <path class="st0"
                                      d="m480.3 237.2c-4.3 2.5-5.8 8-3.4 12.4 1.7 3.1 41.9 75.6-25.8 143.4-24.9 24.9-82.8 35.4-126.3 10.6-43.7-24.8-57.9-77.1-40-147.2 1.2-4.9-1.7-9.8-6.6-11-4.9-1.3-9.8 1.7-11 6.6-27 106.2 18.9 150.5 48.6 167.4 19.4 11.1 42.6 16.4 65.5 16.4 31.8 0 62.9-10.3 82.6-30 77.8-77.8 29.2-164.4 28.7-165.2-2.5-4.4-8-5.9-12.3-3.4z"/>
                                <path class="st0"
                                      d="m411.1 0h-127.1l-33.6 33.5c39 5.1 80 18 120.9 42.6 6.4 3.8 13.8 6 21.2 5.6 6.5-0.3 13.7 1.4 21.7 7.4 9.1 6.8 15.6 17 15.6 28.3 0 19.7-16 35.6-35.7 35.6-10.5 0-20-4.6-26.5-11.9-3.4-3.7-7.1-7.2-11.3-10-54.2-36.6-109-47.5-157.9-45.9l-144 143.6 0.1 0.1-54.5 54.4 228.2 228.7 77.7-77.5c-27.9-16.3-86.6-65.9-56.6-185.9 3.2-12.9 15-22.6 28.3-21.7 17.6 1.2 29 17.7 24.8 33.9-15.9 62.3-5 106.2 31.4 126.9 4.2 2.4 8.5 4.3 13 5.9l120.4-120.1c-2.8-9.2-5.9-14.8-6.1-14.9-7.5-13-3.1-29.7 10-37.2 13-7.5 29.7-3.1 37.2 10 0.1 0.2 0.3 0.5 0.4 0.8l3.2-3.2v-128.4l-100.8-100.6z"/>
                                <rect class="st1" transform="matrix(.7071 -.7071 .7071 .7071 -187.2 450.31)" x="-175.1"
                                      y="445.2" width="1250.2" height="11.9"/>
                                <path class="st0"
                                      d="m754.1 699.8c30.6-22.3 49.2-57.5 49.2-94.6 0-16.7-0.9-30.6-2.8-42.7h22.3c5.6 0 10.2-4.6 10.2-10.2v-44.5c0-5.6-4.6-10.2-10.2-10.2h-17.6c-9.3-46.4-43.6-84.4-89-97.4v-17.6c0-5.6-4.6-10.2-10.2-10.2h-51c-5.6 0-10.2 4.6-10.2 10.2v17.6c-45.4 13-79.8 51-89 97.4h-17.8c-5.6 0-10.2 4.6-10.2 10.2v44.5c0 5.6 4.6 10.2 10.2 10.2h21.3c-1.9 12.1-2.8 26.9-2.8 42.7 0 37.1 18.6 72.3 49.2 94.6-75.1 28.8-126.1 97.4-126.1 174.4 0 5.6 4.6 10.2 10.2 10.2h379.4c5.6 0 10.2-4.6 10.2-10.2-0.1-77-51.1-145.7-125.3-174.4zm-206.8-157.7v-23.2h16.7c2.8 0 4.6-0.9 6.5-2.8 0.9-0.9 2.8-3.7 3.7-6.5 4.6-39.9 32.5-73.3 69.6-87.2v64.9c0 5.6 4.6 10.2 10.2 10.2s10.2-4.6 10.2-10.2v-94.6h30.6v93.7c0 5.6 4.6 10.2 10.2 10.2s10.2-4.6 10.2-10.2v-64c37.1 13.9 64.9 47.3 69.6 87.2 0 2.8 1.9 5.6 3.7 6.5 3.7 2.8 5.6 2.8 7.4 2.8h16.7v23.2h-265.3zm-46.4 320.9c5.6-70.5 58.4-131.7 132.6-150.3 4.6-0.9 7.4-4.6 8.3-9.3 0-4.6-1.9-8.3-6.5-10.2-35.2-16.7-57.5-50.1-57.5-88.1 0-16.7 0.9-30.6 2.8-42.7h198.4c1.9 12.1 2.8 26 2.8 42.7 0 38-22.3 71.4-57.5 88.1-3.7 1.9-6.5 6.5-6.5 10.2 0 4.6 3.7 8.3 8.3 9.3 74.2 18.6 128 79.8 132.6 150.3h-357.8z"/>
                                <path id="settings_1_" class="st0"
                                      d="m752.2 771.5-15.6-2.6c-1.1-4.6-2.8-9-4.9-13.2l10-12.3c2.1-2.6 2-6.4-0.2-8.9l-6.2-7c-2.2-2.5-6-3-8.8-1.3l-13.3 8.4c-5.9-4.1-12.5-7.1-19.6-8.9l-2.6-15.6c-0.5-3.3-3.4-5.7-6.8-5.7h-9.3c-3.4 0-6.2 2.4-6.8 5.7l-2.6 15.6c-5.9 1.4-11.5 3.8-16.5 6.9l-12.7-9c-2.7-1.9-6.5-1.6-8.9 0.7l-6.6 6.6c-2.4 2.4-2.7 6.1-0.7 8.9l9.1 12.7c-3 5-5.4 10.5-6.8 16.4l-15.7 2.6c-3.3 0.5-5.7 3.4-5.7 6.8v9.3c0 3.4 2.4 6.2 5.7 6.8l15.7 2.6c1.2 4.8 2.9 9.4 5.2 13.7l-9.9 12.3c-2.1 2.6-2 6.4 0.2 8.9l6.2 7c2.2 2.5 6 3 8.8 1.3l13.5-8.5c5.7 3.9 12.2 6.8 19.1 8.5l2.6 15.6c0.5 3.3 3.4 5.7 6.8 5.7h9.3c3.4 0 6.2-2.4 6.8-5.7l2.6-15.6c5.8-1.4 11.3-3.7 16.3-6.7l13.2 9.4c2.7 2 6.5 1.6 8.8-0.7l6.6-6.6c2.4-2.4 2.7-6.1 0.7-8.8l-9.4-13.2c3.1-5 5.4-10.6 6.8-16.4l15.6-2.6c3.3-0.5 5.7-3.4 5.7-6.8v-9.3c0.1-3.5-2.3-6.4-5.7-7zm-72.5 40.9c-16.3 0-29.4-13.2-29.4-29.4 0-16.3 13.2-29.4 29.4-29.4 16.3 0 29.4 13.2 29.4 29.4 0.1 16.2-13.1 29.4-29.4 29.4z"/>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Продажа и укладка</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg width="512px" height="512px" enable-background="new 0 0 512 512" version="1.1"
                                 viewBox="0 0 512 512" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <path d="m486.64 424.96c-51.2-26.948-90.351-41.899-125.12-47.804l3.78-5.205c1.485-2.039 1.997-4.642 1.374-7.091l-7.919-31.676c2.901-4.087 5.632-8.311 8.201-12.646 31.889-10.82 48.051-29.124 50.714-56.175 14.507-0.879 26.069-12.843 26.069-27.563v-64c0-14.626-11.418-26.513-25.779-27.537-2.015-49.57-23.826-145.26-161.96-145.26-138.14 0-159.95 95.693-161.95 145.26-14.37 1.024-25.779 12.911-25.779 27.537v64c0 15.292 12.442 27.733 27.733 27.733h12.8c4.975 0 9.583-1.425 13.619-3.729 4.873 25.66 15.616 50.927 30.822 72.38l-7.919 31.676c-0.614 2.449-0.111 5.052 1.374 7.091l3.789 5.205c-34.773 5.905-73.924 20.855-125.13 47.804-15.641 8.235-25.352 24.337-25.352 42.027v36.48c0 4.71 3.814 8.533 8.533 8.533h208.01l78.541-0.077c0.136 9e-3 0.256 0.077 0.393 0.077h207.99c4.71 0 8.533-3.823 8.533-8.533v-36.48c0-17.69-9.719-33.792-25.361-42.027zm-107.91-128.03c4.847-11.708 8.516-23.868 10.846-36.122 3.32 1.894 7.031 3.089 11.025 3.465-1.476 12.211-6.903 23.663-21.871 32.657zm-257.26-148.65c-3.157-1.638-6.639-2.662-10.351-2.978 2.1-51.439 25.276-128.23 144.89-128.23 119.6 0 142.78 76.792 144.88 128.23-3.712 0.316-7.194 1.34-10.351 2.978-10.735-64.648-66.893-114.14-134.53-114.14-67.644 0-123.8 49.494-134.54 114.14zm41.379 216.86 3.831-15.309c0.034 0.043 0.068 0.068 0.102 0.102 20.617 22.409 46.831 38.195 76.39 41.788 0.017 0 0.034 9e-3 0.06 9e-3l-3.866 8.687-19.294 43.409-57.223-78.686zm93.158 39.885 21.001 47.249h-42.001l21-47.249zm-32.256 89.907 5.111-25.591h54.281l5.12 25.532-64.512 0.059zm68.181-51.106-19.294-43.409-3.857-8.687c0.017 0 0.034-9e-3 0.051-9e-3 29.559-3.592 55.782-19.379 76.39-41.788 0.034-0.034 0.077-0.06 0.102-0.102l3.84 15.309-57.232 78.686zm-27.392-128.09c-4.719 0-8.533 3.823-8.533 8.533s3.814 8.533 8.533 8.533c31.181 0 57.028-1.997 78.234-6.042-0.324 0.427-0.674 0.828-1.007 1.254-0.299 0.282-0.691 0.469-0.947 0.802-2.927 3.746-5.965 7.287-9.088 10.607l-0.077 0.077c-2.057 2.185-4.215 4.13-6.349 6.127-20.864 18.816-45.645 29.841-69.299 29.841-23.663 0-48.444-11.025-69.299-29.833-2.142-2.005-4.301-3.951-6.357-6.144-0.026-0.017-0.043-0.043-0.068-0.06-3.123-3.328-6.161-6.869-9.097-10.615-0.256-0.333-0.64-0.521-0.947-0.802-20.105-25.37-33.698-59.187-33.698-97.613v-59.733c-1e-3 -65.876 53.589-119.46 119.47-119.46 65.869 0 119.47 53.589 119.47 119.47v59.733c0 28.339-7.467 54.127-19.379 75.938-20.378 5.88-49.639 9.395-91.555 9.395z"
                                      fill="#345c04"/>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Команда профессионалов</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 utp__item">
                        <figure class="utp__img">
                            <svg width="512px" height="512px" enable-background="new 0 0 459.419 459.419" version="1.1"
                                 viewBox="0 0 459.42 459.42" xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/"
                                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata>
                                    <rdf:RDF>
                                        <cc:Work rdf:about="">
                                            <dc:format>image/svg+xml</dc:format>
                                            <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                            <dc:title/>
                                        </cc:Work>
                                    </rdf:RDF>
                                </metadata>
                                <g fill="#345c04">
                                    <polygon
                                            points="83.115 172.91 376.3 172.91 376.3 459.42 458.78 459.42 458.78 106.96 223.18 0 0.642 106.96 0.642 459.42 83.115 459.42"/>
                                    <rect x="171.16" y="403.54" width="52.023" height="44.878"/>
                                    <rect x="235" y="403.54" width="52.023" height="44.878"/>
                                    <rect x="107.31" y="403.54" width="52.023" height="44.878"/>
                                    <rect x="171.16" y="341.98" width="52.023" height="44.878"/>
                                    <rect x="107.31" y="341.98" width="52.023" height="44.878"/>
                                    <rect x="235" y="341.98" width="52.023" height="44.878"/>
                                    <rect x="171.16" y="280.44" width="52.023" height="44.878"/>
                                    <rect x="107.31" y="280.44" width="52.023" height="44.878"/>
                                    <rect x="298.85" y="403.54" width="52.023" height="44.878"/>
                                </g>
</svg>
                        </figure>
                        <div class="utp__text">
                            <span>Склад и офис в Москве</span>
                        </div>
                    </div>
                </div><!-- .row 2 -->
            </div>
        </div>
    </section><!-- .utp -->

    <section class="section seo">
        <div class="section__layer section__front">
            <div class="container">
                <article class="clearfix post">
                    <h1><?= $settings->seo_title ?></h1>
                    <?= $settings->seo_description ?>
                </article>
            </div>
        </div>
    </section><!-- .seo -->

</main>
<!-- Backend - this will replaced with backend function to add class -->
<script>
    document.querySelector('.page').classList.add('page-index');
</script>
