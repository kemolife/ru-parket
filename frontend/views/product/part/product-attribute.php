<div class="row align-items-center py-1">
    <div class="col-7 d-flex align-items-center">
        <span class="d-block mr-2 icon">
            <img src="/<?= $attribute->group->image ?>" alt="attribute icon">
        </span>
        <span>
            <b><?= $attribute->group->name ?>:</b>
        </span>
    </div>
    <div class="col"><?= $attribute->name ?></div>
</div>