import 'package:aqueduct/aqueduct.dart';
import 'package:schat_server/model/Hero.dart';
import 'package:schat_server/schat_server.dart';

class HeroesController extends ResourceController {
  HeroesController(this.context);

  final ManagedContext context;
  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];
  @Operation.get()
  Future<Response> getAllHeroes({@Bind.query('name') String name}) async {
    final heroQuery = Query<Hero>(context);
    if (name != null) {
      heroQuery.where((h) => h.name).contains(name, caseSensitive: false);
    }
    final heroes = await heroQuery.fetch();
    return Response.ok(heroes);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
//    final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);

    final heroQuery = Query<Hero>(context)
      ..where((h) => h.id).equalTo(id);

    final hero = await heroQuery.fetchOne();

    if (hero == null) {
      return Response.notFound();
    }

    return Response.ok(hero);
  }
  @Operation.post()
  Future<Response> createHero(@Bind.body(ignore: ["id"]) Hero inputHero) async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Hero>(context)
//      ..values.name = body['name'] as String;
        ..values = inputHero;
    final insertedHero = await query.insert();

    return Response.ok(insertedHero);
  }
}
