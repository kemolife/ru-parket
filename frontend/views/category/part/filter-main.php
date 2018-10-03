<form class="filter-box">
    <div class="row">
        <div class="col-md-4">
            <div class="filter-box-inner filter-price">
                <div class="h3">Цена (₽/м2):</div>
                <!-- BACKEND -->
                <script>
                    // change this values!;
                    window.minPriceRange = 0;
                    window.maxPriceRange = 50000;
                </script>
                <!-- // BACKEND -->
                <div class="form-group range-input">
                    <input type="text" id="minPrice" data-price="min" readonly class="d-inline-block filter-range-field">
                    <span class="line text-hide">-</span>
                    <input type="text" id="maxPrice" data-price="max" readonly class="d-inline-block filter-range-field">
                    <span class="currency">₽</span>
                </div>
                <div id="filterRange" class="filter-range"></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="filter-box-inner border-bottom">
                <div class="h3">Количество полос:</div>
                <ul id="filterList2" class="filter-checkbox">
                    <li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">1 - полосный (5)</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">2 - полосный (5)</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">3 - полосный (5)</span>
                        </label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div class="filter-box-inner border-bottom">
                <div class="h3">Покрытие:</div>
                <ul id="filterList3" class="filter-checkbox">
                    <li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Лак (5)</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Масло (5)</span>
                        </label>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div class="filter-box-inner border-bottom">
                <div class="h3 invisible">цена:</div>
                <ul id="filterList4" class="filter-checkbox">
                    <li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">200 - 1000 ₽</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">1000 - 2000 ₽</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">2000 - 3000 ₽</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">3000 - 4000 ₽</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">4000 - 5000 ₽</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">5000 - 10000 ₽</span>
                        </label>
                    </li>
                </ul>
                <button class="btn btn-link border-bottom" type="button" data-hide='hideText' data-target='#filterList4'>
                    <span>Еще (5)</span>
                </button>
            </div>
        </div>
        <div class="col-md-4">
            <div class="filter-box-inner border-bottom">
                <div class="h3">Производитель:</div>
                <ul id="filterList5" class="filter-checkbox">
                    <li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Par ky</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Таркетт</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Barlinek</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Карелия</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Kahrs</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Карелия</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Kahrs</span>
                        </label>
                    </li>
                </ul>
                <button class="btn btn-link border-bottom" type="button" data-hide='hideText' data-target='#filterList5'>
                    <span>Еще (10)</span>
                </button>
            </div>
        </div>
        <div class="col-md-4">
            <div class="filter-box-inner border-bottom">
                <div class="h3">Порода дерева:</div>
                <ul id="filterList6" class="filter-checkbox">
                    <li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Дуб</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бамбук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Орех</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Ясень</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бамбук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Орех</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Ясень</span>
                        </label>
                    </li>
                </ul>
                <button class="btn btn-link border-bottom" type="button" data-hide='hideText' data-target='#filterList6'>
                    <span>Еще (20)</span>
                </button>
            </div>
        </div>
        <div class="col-md-4">
            <div class="filter-box-inner filter-box-more py-0">
                <div class="h3">Порода дерева <i class="material-icons" aria-hidden="true">expand_more</i></div>
                <ul id="filterList6" class="filter-checkbox collapse">
                    <li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Дуб</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бамбук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Орех</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Ясень</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Бамбук</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Орех</span>
                        </label>
                    </li><li>
                        <label class="d-flex">
                            <input type="checkbox" class="checkbox">
                            <span class="checkbox-text">Ясень</span>
                        </label>
                    </li>
                </ul>
                <button class="btn btn-link border-bottom collapse" type="button" data-hide='hideText' data-target='#filterList6'>
                    <span>Еще (20)</span>
                </button>
            </div>
        </div>
    </div><!-- .row -->
    <div class="buttons text-center hidden__up--lg">
        <button class="btn btn-primary" type="submit">
            <span>Применить</span>
        </button>
    </div>
</form>