import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireapp/components/menu.dart';
import 'package:fireapp/helpers/hour_helpers.dart';
import 'package:fireapp/models/hour.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {

  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Hour> listHours = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(user: widget.user),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showFormModal();
      }, child: const Icon(Icons.add),),
      body: 
        (listHours.isEmpty) 
          ? const Center(child: Text("Nenhuma hora cadastrada", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),) 
          : ListView(
            padding: EdgeInsets.only(left: 4, right: 4),
            children: List.generate(listHours.length, (index) { 
              Hour model = listHours[index];
              return Dismissible(
                key: ValueKey<Hour>(model), 
                direction: DismissDirection.endToStart, 
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 12),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white,),
                ),
                onDismissed: (direction) {
                  remove(model);
                },
                child: Card(
                  elevation: 2,
                  child: Column(children: [
                    ListTile(
                      onLongPress: () {},
                      onTap: () {},
                      leading: Icon(Icons.list_alt_rounded),
                      title: Text("Data ${model.data} hora: ${HourHelpers.minutesToHours(model.minutos)}"),
                      subtitle: Text(model.descricao!),
                    )
                  ],)
                )
              );
            }),
          ),
    );
  }

  showFormModal({Hour? model}) { 
    String title = 'Adicionar';
    String confirmButtonText = 'Salvar';
    String skipButtonText = 'Cancelar';

    TextEditingController dataController = TextEditingController();
    final dataMaskFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });

    TextEditingController minutosController = TextEditingController();
    final minutosMaskFormatter = MaskTextInputFormatter(mask: '##:##', filter: { "#": RegExp(r'[0-9]') });

    TextEditingController descricaoController = TextEditingController();

    if (model != null) {
      title = 'Editando';
      dataController.text = model.data;
      minutosController.text = HourHelpers.minutesToHours(model.minutos);
      if (model.descricao != null) descricaoController.text = model.descricao!;
      descricaoController.text = model.descricao!;
      confirmButtonText = 'Atualizar';
      skipButtonText = 'Cancelar';
    }

    showModalBottomSheet(
      context: context, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24))
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32),
          child: ListView(
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall,),
              TextFormField(
                controller: dataController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(hintText: '01/01/2025', labelText: 'Data'),
                inputFormatters: [dataMaskFormatter],
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: minutosController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: '00:00', labelText: 'Horas trabalhadas'),
                inputFormatters: [minutosMaskFormatter],
              ),
              SizedBox(height: 16,),
              TextFormField(
                controller: descricaoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: 'Lembrete do que você trabalhou', labelText: 'Descrição'),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text(skipButtonText)),
                  ElevatedButton(onPressed: () {
                    Hour hour = Hour(
                      id: const Uuid().v4(),
                      data: dataController.text,
                      minutos: HourHelpers.hoursToMinutes(minutosController.text),
                    );
                    if (descricaoController.text.isNotEmpty) hour.descricao = descricaoController.text;
                    if (model != null) {
                      hour.id = model.id;
                    }
                    firestore.collection(widget.user.uid).doc(hour.id).set(hour.toMap());
                    refresh();
                    Navigator.pop(context);
                  }, child: Text(confirmButtonText)),
                ],
              ),
              SizedBox(height: 160,)
            ],)
        );
      }
    );
  }
  
  void remove(Hour model) {
    firestore.collection(widget.user.uid).doc(model.id).delete();
    refresh();
  }
  
  void refresh() {

  }
}

