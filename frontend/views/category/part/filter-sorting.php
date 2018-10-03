<div class="row justify-content-between">
    <div class="col d-flex">
        <div class="dropdown sorting-select">
            <button class="btn dropdown-toggle border-bottom" type="button" id="sortByName"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">По имени
            </button>
            <div class="dropdown-menu" aria-labelledby="sortByName">
                <a class="dropdown-item" href="#">По возрастанию цены</a>
                <a class="dropdown-item" href="#">По убыванию цены</a>
                <a class="dropdown-item" href="#">По названию</a>
            </div>
        </div>
        <div class="dropdown sorting-select hidden__down--md">
            <button class="btn dropdown-toggle border-bottom" type="button" id="itemsToShow"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">16
            </button>
            <div class="dropdown-menu" aria-labelledby="itemsToShow">
                <a class="dropdown-item" href="#">32</a>
                <a class="dropdown-item" href="#">48</a>
                <a class="dropdown-item" href="#">64</a>
            </div>
        </div>
    </div>
    <div class="col d-flex justify-content-end">
        <button id="catFilterToggle" class="btn-icon-only d-lg-none" data-target="#catFilter"
                data-toggle="filter"><i class="material-icons">tune</i></button>
        <a href="catalog.html" class="btn-icon-only hidden__down--md"><i class="material-icons">apps</i></a>
        <a href="catalog.html" class="btn-icon-only hidden__down--md"><i class="material-icons">view_list</i></a>
    </div>
</div>