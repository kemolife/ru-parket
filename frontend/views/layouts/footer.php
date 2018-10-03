<!-- footer -->
<?php
$settings = \common\models\Settings::find()->one();
?>
<footer id="footer" class="footer bg-success text-light">
    <div class="footer__top">
        <div class="container">
            <div class="row">
                <div class="col-6 col-xl-4 footer__nav">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="#" class="nav-link d-inline-block @@class" title="Напольные покрытия">Напольные покрытия</a>
                        </li><li class="nav-item">
                            <a href="#" class="nav-link d-inline-block @@class" title="Сопутствующие товары">Сопутствующие товары</a>
                        </li><li class="nav-item">
                            <a href="#" class="nav-link d-inline-block @@class" title="Карта сайта">Карта сайта</a>
                        </li><li class="nav-item">
                            <a href="#" class="nav-link d-inline-block @@class" title="Политика конфиденциальности">Политика конфиденциальности</a>
                        </li>
                    </ul>
                    <div class="text-small hidden__down--lg">
                        <?= $settings->policy ?>
                    </div>
                </div>
                <div class="col-6 col-xl-2 footer__nav">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/about']) ?>" class="nav-link d-inline-block @@class" title="О компании">О компании</a>
                        </li><li class="nav-item">
                            <a href="<?= Yii::$app->urlManager->createUrl(['/blog']) ?>" class="nav-link d-inline-block @@class" title="Блог">Блог</a>
                        </li><li class="nav-item">
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/payment-delivery']) ?>" class="nav-link d-inline-block @@class" title="Оплата и доставка">Оплата и доставка</a>
                        </li><li class="nav-item">
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/warranty']) ?>" class="nav-link d-inline-block @@class" title="Гарантия">Гарантия</a>
                        </li><li class="nav-item">
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/service']) ?>" class="nav-link d-inline-block @@class" title="Сервис">Сервис</a>
                        </li><li class="nav-item">
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/contact']) ?>" class="nav-link d-inline-block @@class" title="Контакты">Контакты</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xl-3 footer__coop">
                    <div class="row">
                        <div class="col-6 col-xl-12">
                            <div class="h3">Оплата</div>
                            <figure class="payment_sys">
                                <img src="/img/oplata_s.png" alt="payments_sprite">
                            </figure>
                        </div>
                        <div class="col-6 col-xl-12">
                            <div class="h3">Доставка</div>
                            <figure class="delivery_sys">
                                <img src="/img/delovye-linii.png" alt="delovyi-linii">
                            </figure>
                        </div>
                        <figure class="col-12 coop_sys">
                            <img src="/img/yandex.png" alt="yandex">
                        </figure>
                    </div>
                </div>
                <div class="col-xl-3 footer__contacts">
                    <ul class="footer__contacts--list">
                        <li class="footer__contacts--item d-flex align-items-center">
                            <i class="material-icons">phone</i>
                            <div class="footer__contacts--content d-flex flex-column">
                                <span class="telephone"><?= $settings->phone ?></span>
                                <a href="tel:<?= $settings->phone ?>" class="border-bottom" role="button" title="Call us" data-toggle="modal" data-target="#callbackModal">
                                    <span>Заказать обратный звонок</span>
                                </a>
                            </div>
                        </li>
                        <li class="footer__contacts--item d-flex align-items-center">
                            <i class="material-icons">email</i>
                            <div class="footer__contacts--content">
                                <a href="mailto:info@ru-parket.ru" title="write to mail"><?= $settings->email ?></a>
                            </div>
                        </li>
                        <li class="footer__contacts--item d-flex align-items-center">
                            <i class="material-icons">location_on</i>
                            <div class="footer__contacts--content">
                                <span><?= $settings->address ?></span>
                            </div>
                        </li>
                        <li class="footer__contacts--item d-flex align-items-center work-time">
                            <i class="material-icons">watch_later</i>
                            <div class="footer__contacts--content">
                                <table>
                                    <?= $settings->work_hours ?>
                                </table>
                                <!--<span>Пн-Сб: 9:00 - 19:00 <br>Вс:       9:00 - 17:00</span>-->
                            </div>
                        </li>
                    </ul>
                    <ul class="d-flex footer__contacts--socials">
                        <li class="footer__contacts--social">
                            <a href="<?= $settings->facebook ?>" title="Наш facebook" target="_blank">
                                <svg width="512px" height="512px" enable-background="new 0 0 430.113 430.114" version="1.1" viewBox="0 0 430.11 430.11" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata>
                                    <path id="Facebook" d="m158.08 83.3v59.218h-43.385v72.412h43.385v215.18h89.122v-215.18h59.805s5.601-34.721 8.316-72.685h-67.784s0-42.127 0-49.511c0-7.4 9.717-17.354 19.321-17.354h48.557v-75.385h-66.021c-93.519-5e-3 -91.316 72.479-91.316 83.299z" fill="#345c04"/>
								</svg>
                            </a>
                        </li>
                        <li class="footer__contacts--social">
                            <a href="<?= $settings->google ?>" title="Наш google plus" target="_blank">
                                <svg width="512px" height="512px" enable-background="new 0 0 604.35 604.35" version="1.1" viewBox="0 0 604.35 604.35" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata>
                                    <g id="google-plus">
                                        <path d="m516.38 255v-76.5h-51v76.5h-76.5v51h76.5v76.5h51v-76.5h76.5v-51h-76.5zm-196.35 86.7-28.051-20.4c-10.2-7.649-20.399-17.85-20.399-35.7s12.75-33.15 25.5-40.8c33.15-25.5 66.3-53.55 66.3-109.65 0-53.55-33.15-84.15-51-99.45h43.35l30.6-35.7h-158.1c-112.2 0-168.3 71.4-168.3 147.9 0 58.65 45.9 122.4 127.5 122.4h20.4c-2.55 7.65-10.2 20.4-10.2 33.15 0 25.5 10.2 35.7 22.95 51-35.7 2.55-102 10.2-150.45 40.8-45.9 28.05-58.65 66.3-58.65 94.35 0 58.65 53.55 114.75 168.3 114.75 137.7 0 204-76.5 204-150.45-1e-3 -53.551-28.051-81.601-63.751-112.2zm-193.8-232.05c0-56.1 33.15-81.6 68.85-81.6 66.3 0 102 89.25 102 140.25 0 66.3-53.55 79.05-73.95 79.05-63.75 0-96.9-79.05-96.9-137.7zm91.799 459c-84.15 0-137.7-38.25-137.7-94.351 0-56.1 51-73.95 66.3-81.6 33.15-10.2 76.5-12.75 84.15-12.75s12.75 0 17.85 0c61.2 43.35 86.7 61.2 86.7 102 0 48.451-48.449 86.701-117.3 86.701z" fill="#345c04"/>
                                    </g>
								</svg>
                            </a>
                        </li>
                        <li class="footer__contacts--social">
                            <a href="<?= $settings->linkedin ?>" title="Наш linkedin" target="_blank">
                                <svg width="512px" height="512px" enable-background="new 0 0 430.117 430.117" version="1.1" viewBox="0 0 430.12 430.12" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata>
                                    <path id="LinkedIn" d="m430.12 261.54v159.02h-92.188v-148.37c0-37.271-13.334-62.707-46.703-62.707-25.473 0-40.632 17.142-47.301 33.724-2.432 5.928-3.058 14.179-3.058 22.477v154.87h-92.219s1.242-251.28 0-277.32h92.21v39.309c-0.187 0.294-0.43 0.611-0.606 0.896h0.606v-0.896c12.251-18.869 34.13-45.824 83.102-45.824 60.673-1e-3 106.16 39.636 106.16 124.82zm-377.93-251.98c-31.548 0-52.183 20.693-52.183 47.905 0 26.619 20.038 47.94 50.959 47.94h0.616c32.159 0 52.159-21.317 52.159-47.94-0.606-27.212-20-47.905-51.551-47.905zm-46.706 411h92.184v-277.32h-92.184v277.32z" fill="#345c04"/>
								</svg>
                            </a>
                        </li>
                        <li class="footer__contacts--social">
                            <a href="<?= $settings->twitter ?>" title="Наш twitter" target="_blank">
                                <svg width="512px" height="512px" enable-background="new 0 0 612 612" version="1.1" viewBox="0 0 612 612" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata>
                                    <path d="m612 116.26c-22.525 9.981-46.694 16.75-72.088 19.772 25.929-15.527 45.777-40.155 55.184-69.411-24.322 14.379-51.169 24.82-79.775 30.48-22.907-24.437-55.49-39.658-91.63-39.658-69.334 0-125.55 56.217-125.55 125.51 0 9.828 1.109 19.427 3.251 28.606-104.33-5.24-196.84-55.223-258.75-131.17-10.823 18.51-16.98 40.078-16.98 63.101 0 43.559 22.181 81.993 55.835 104.48-20.575-0.688-39.926-6.348-56.867-15.756v1.568c0 60.806 43.291 111.55 100.69 123.1-10.517 2.83-21.607 4.398-33.08 4.398-8.107 0-15.947-0.803-23.634-2.333 15.985 49.907 62.336 86.199 117.25 87.194-42.947 33.654-97.099 53.655-155.92 53.655-10.134 0-20.116-0.612-29.944-1.721 55.567 35.681 121.54 56.485 192.44 56.485 230.95 0 357.19-191.29 357.19-357.19l-0.421-16.253c24.666-17.593 46.005-39.697 62.794-64.861z" fill="#345c04"/>
							</svg>
                            </a>
                        </li>
                        <li class="footer__contacts--social">
                            <a href="<?= $settings->youtube ?>" title="Наш youtube" target="_blank">
                                <svg width="512px" height="512px" enable-background="new 0 0 511.627 511.627" version="1.1" viewBox="0 0 511.63 511.63" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><metadata><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title/></cc:Work></rdf:RDF></metadata>
                                    <g fill="#345c04">
                                        <path d="m459.95 264.38c-2.471-11.233-7.949-20.653-16.416-28.264-8.474-7.611-18.227-12.085-29.27-13.418-35.02-3.806-87.837-5.708-158.46-5.708-70.618 0-123.34 1.903-158.17 5.708-11.227 1.333-21.029 5.807-29.407 13.418-8.376 7.614-13.896 17.035-16.562 28.264-4.948 22.083-7.423 55.391-7.423 99.931 0 45.299 2.475 78.61 7.423 99.93 2.478 11.225 7.951 20.653 16.421 28.261 8.47 7.614 18.225 11.991 29.263 13.134 35.026 3.997 87.847 5.996 158.46 5.996 70.609 0 123.44-1.999 158.45-5.996 11.043-1.143 20.748-5.52 29.126-13.134 8.377-7.607 13.897-17.036 16.56-28.261 4.948-22.083 7.426-55.391 7.426-99.93-1e-3 -45.3-2.479-78.612-7.424-99.931zm-294.93 28.842h-30.549v162.45h-28.549v-162.45h-29.98v-26.837h89.079v26.837zm77.085 162.45h-25.41v-15.421c-10.278 11.615-19.989 17.419-29.125 17.419-8.754 0-14.275-3.524-16.556-10.564-1.521-4.568-2.286-11.519-2.286-20.844v-111.63h25.41v103.92c0 6.088 0.096 9.421 0.288 9.993 0.571 3.997 2.568 5.995 5.996 5.995 5.138 0 10.566-3.997 16.274-11.991v-107.92h25.41v141.04zm97.073-42.257c0 13.894-0.855 23.417-2.56 28.558-3.244 10.462-9.996 15.697-20.273 15.697-9.137 0-17.986-5.235-26.556-15.697v13.702h-25.406v-189.29h25.406v61.955c8.189-10.273 17.036-15.413 26.556-15.413 10.277 0 17.029 5.331 20.273 15.988 1.704 4.948 2.56 14.369 2.56 28.264v56.236zm96.502-23.408h-51.104v24.839c0 13.134 4.374 19.697 13.131 19.697 6.279 0 10.089-3.422 11.42-10.28 0.376-1.902 0.571-7.706 0.571-17.412h25.981v3.71c0 9.329-0.195 14.846-0.572 16.563-0.567 5.133-2.56 10.273-5.995 15.413-6.852 10.089-17.139 15.133-30.841 15.133-13.127 0-23.407-4.855-30.833-14.558-5.517-7.043-8.275-18.083-8.275-33.12v-49.396c0-15.036 2.662-26.076 7.987-33.119 7.427-9.705 17.61-14.558 30.557-14.558 12.755 0 22.85 4.853 30.263 14.558 5.146 7.043 7.71 18.083 7.71 33.119v29.411z"/>
                                        <path d="m302.63 336.04c-4.38 0-8.658 2.101-12.847 6.283v85.934c4.188 4.186 8.467 6.279 12.847 6.279 7.419 0 11.14-6.372 11.14-19.13v-60.236c-1e-3 -12.755-3.713-19.13-11.14-19.13z"/>
                                        <path d="m397.43 336.04c-8.565 0-12.847 6.475-12.847 19.41v13.134h25.693v-13.134c0-12.942-4.284-19.41-12.846-19.41z"/>
                                        <path d="m148.47 113.92v77.375h28.549v-77.375l34.541-113.92h-29.121l-19.41 75.089-20.273-75.089h-30.262c5.33 15.99 11.516 33.785 18.559 53.391 8.947 26.265 14.749 46.444 17.417 60.526z"/>
                                        <path d="m249.82 193.29c13.134 0 23.219-4.854 30.262-14.561 5.332-7.043 7.994-18.274 7.994-33.689v-49.966c0-15.225-2.669-26.363-7.994-33.406-7.043-9.707-17.128-14.561-30.262-14.561-12.756 0-22.75 4.854-29.98 14.561-5.327 7.043-7.992 18.181-7.992 33.406v49.965c0 15.225 2.662 26.457 7.992 33.689 7.233 9.708 17.223 14.562 29.98 14.562zm-12.279-103.36c0-13.134 4.093-19.701 12.279-19.701s12.275 6.567 12.275 19.701v59.955c0 13.328-4.089 19.985-12.275 19.985s-12.279-6.661-12.279-19.985v-59.955z"/>
                                        <path d="m328.33 193.29c9.523 0 19.328-5.901 29.413-17.705v15.703h25.981v-142.47h-25.981v108.78c-5.712 8.186-11.133 12.275-16.279 12.275-3.429 0-5.428-2.093-5.996-6.28-0.191-0.381-0.287-3.715-0.287-9.994v-104.78h-25.981v112.49c0 9.705 0.767 16.84 2.286 21.411 2.477 7.043 8.09 10.566 16.844 10.566z"/>
                                    </g>
								</svg>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="footer__bottom">
        <div class="container text-center">
            <span>&copy; ru-parket.ru, <span id="currentYear"></span>, Разработано в <a href="https://onweb.com.ua" title="Onweb" target="_blank">OnWeb</a></span>
        </div>
    </div>
</footer>
