<?php

@define('VERSION', '0.0.1');
@define('ROOT', __DIR__.'/');


@define('APP', ROOT.'APP/');
@define('CONTROLLERS', APP.'Controllers/');
@define('ROUTERS', APP.'Routers/');
@define('MODELS', APP.'models/');
@define('SYSTEMS', APP.'Systems/');

@define('VENDOR', ROOT.'vendor/');
require VENDOR.'autoload.php';

