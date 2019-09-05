# laravel-model-json-storage

## Install

```bash
$ composer update okipa/laravel-model-json-storage
```

## Model

```php
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Okipa\LaravelModelJsonStorage\ModelJsonStorage;

class JsonStorage extends Model
{
	use ModelJsonStorage;

	protected $primaryKey = null;
	protected $fillable = [
		'name'
	];
}
```

## Invoke

```php
	$testModel = app(JsonStorage::class)->create([
		'name' => 'John Doe',
	])->save();


	return view('welcome', ['test' => app(JsonStorage::class)->all()]);
```
