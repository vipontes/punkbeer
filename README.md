# Punkbeer

Punkbeer é um aplicativo desenvolvido em Swift 4 o qual usa [Punk API](https://punkapi.com/documentation/v2) para listar cervejas e suas características

## Visão geral

A tela inicial do app é uma TabView com dois tabs: Cervejas e Favoritos.

Utilizei [Alamofire](https://github.com/Alamofire/Alamofire) para as chamadas HTTP. Ao iniciar ele trás os primeiros 25 registros retornados pela API e implementa um recurso de "Infinite Scroll", buscando mais 25 toda vez que o último item do tableView é visualizado. 

Clicando em um item ele direciona para uma ViewController onde os detalhes do item selecionado são apresentados.

Nessa ViewController, o usuário pode favoritar uma cerveja. A cerveja favoritada tem seu ID registrado em um banco de dados local, usando o [Realm](https://realm.io/docs/swift/latest/). O correto seria armazenar os favoritos através da API, mas como não temos esse recurso, improvisei usando um banco de dados local.

Na lista de detalhes é possível visualizar os ingredientes da cerveja e quais pratos mais combinam com a mesma.

Utilizei também a biblioteca [HeroTransitions](https://github.com/HeroTransitions/Hero) para fazer a transição entra as telas de listagem/favoritos para a tela de detalhes.

Também implementei a internacionalização da interface do app.

## Dependências

O código utiliza as seguintes pods:

```bash
pod 'Alamofire', '4.9.0'
pod 'SwiftyJSON', '5.0.0'
pod 'Hero', '1.4.0'
pod 'RealmSwift', '3.18.0'
```

## Problemas conhecidos

O scroll na tela de detalhes não está funcionando corretamente.

## Licença de uso

[MIT](https://choosealicense.com/licenses/mit/)
