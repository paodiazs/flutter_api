import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {//home es un statefulwidget
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();//clase homestate 
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  List<Character> characters = [];

  @override
  void initState() {//en este método
    super.initState();
    _getData();//cargamos getData
  }

  _getData() async {//método privado: para que no se acceda a este elemento fuera de la clase
    try {
      String url = "https://rickandmortyapi.com/api/character";
      http.Response res = await http.get(Uri.parse(url));//utilizamos http para la solicitud GET
      if (res.statusCode == 200) {
        Map<String, dynamic> data = json.decode(res.body);
        List<dynamic> results = data['results'];
        characters = results.map((character) => Character.fromJson(character)).toList();
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//para el titulo fijo
        title: const Text("Rick and Morty API"),
      ),
      body: Center(
        child: _isLoading
        //ciclo if
            ? CircularProgressIndicator() // Si _isLoading es true, muestra un indicador de progreso circular.
            : ListView.builder( // Si _isLoading es false, muestra una lista de elementos.
                scrollDirection: Axis.vertical,
                // como se construye cada elemento de la lista.
                itemBuilder: (context, index) {
                  return ListTile(
                    //imagen
                    leading: Image.network(characters[index].image),
                    //nombre
                    title: Text(characters[index].name),
                    //estado
                    subtitle: Text("Status: ${characters[index].status}"),
                  );
                },
                //num elementos
                itemCount: characters.length,
              ),
      ),
    );
  }
}

class Character {//modelo de datos que muestra las propiedades de cada personaje
  final int id;
  final String name;
  final String status;
  final String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      image: json['image'],
    );
  }
}

