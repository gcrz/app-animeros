import 'package:flutter/material.dart';

class UserConfig extends StatefulWidget {
  @override
  _UserConfigState createState() => _UserConfigState();
}

class _UserConfigState extends State<UserConfig> {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANIMEROS"),
        centerTitle: true,
      ),
      body: generateConfigForm()
    );
  }

  Widget generateConfigForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          generateChangeEmailTextField(),
          generateChangeUsenameTextFiled(),
          generateUpdateButton()
        ],
      ),
    );
  }

  Widget generateChangeEmailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Insira seu e-mail"
        ),
      ),
    );
  }

  Widget generateChangeUsenameTextFiled() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: "Insira seu nome de usuário"
        ),
      ),
    );
  }

  Widget generateUpdateButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 40,
        width: 100,
        color: Colors.indigo,
        child: Expanded(
          child: TextButton(
            onPressed: () {
              
            },
            style: TextButton.styleFrom(
              primary: Colors.white
            ),
            child: Text("Atualizar")
          ),
        ),
      ),
    );
  }

  

}

