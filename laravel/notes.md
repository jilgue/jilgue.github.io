Notas sobre Laravel
===================

Invocar función desde plantilla blade
-------------------------------------
Para no tener que usar un controlador general por cada página vamos a usar los `@inject` de Laravel. (https://laravel.com/docs/5.8/blade#service-injection) 

```blade
@inject('seo_metas', 'App\Http\Controllers\SeoMetasController')

{{ $seo_metas(request()->getPathInfo()) }}
```
