// enviar informacion en este caso un map
 List<Map<String, dynamic>> animales = [];
Navigator.pushNamed(context, 'detallesAnimales', arguments: animal);

// recuperar informacion normalmente se usa en un widget inteligente o con estado

   Widget build(BuildContext context) {
    final Map animal = ModalRoute.of(context)!.settings.arguments as Map;
     print(animal['titulo']);
