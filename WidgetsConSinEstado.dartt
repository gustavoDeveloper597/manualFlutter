Crear un widget sin estado implica extender de StatelessWidgets

class AnimalsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}

crear un widget con estado implica  extender de StatefulWidget

 
class ContadorScreen extends StatefulWidget {
  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  

  @override
  Widget build(BuildContext context) {
    TextStyle css_titulo = TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador Screen"),
        elevation: 15.5,
      ),
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Click contador",
              style: css_titulo,
            ),
            Text(
              "${contador}",
              style: css_titulo,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonContador(
        onPressIncrementar: incrementar,
        onPressDecrementar: decrementar,
        onPressResetear: resetear,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
