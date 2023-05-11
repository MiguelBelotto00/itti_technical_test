import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itti_technical_test/bloc/clients/client_bloc.dart';
import 'package:itti_technical_test/models/client_model.dart';
import 'package:itti_technical_test/models/user_model.dart';
import 'package:itti_technical_test/pages/client_status_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ClientBloc _clientBloc;
  late StreamSubscription _clientBlocSubscription;
  late ClientModel clientModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _clientBloc = BlocProvider.of<ClientBloc>(context);
    _isLoading = true;
    _clientBlocSubscription = _clientBloc.stream.listen((state) {
      if (state.message?.isNotEmpty ?? false) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message ?? "Ha ocurrido un error")));
        _isLoading = false;
      } else {
        if (mounted) {
          setState(() {
            clientModel = state.client;
            _isLoading = false;
          });
        }
      }
    });
    _clientBloc.getClientState();
  }

  void verifyUrlAndLaunch(String email) async {
    Uri uri = Uri(scheme: "mailto", path: email);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text("Ha ocurrido un error")));
    }
  }

  String getName(UserModel user) {
    return "${user.firstName} ${user.lastName}";
  }

  Widget getEmailLink(UserModel user) {
    return GestureDetector(
        onTap: () => verifyUrlAndLaunch(user.email),
        child: Text(
          user.email,
          style:
              const TextStyle(color: Colors.blue, fontFamily: "Merriweather"),
        ));
  }

  void goToOtherScreen(String username) {
    final num random = Random().nextInt(100) + 1;
    if (random <= 20) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClientStatusPage(
                    clientStatus: "Cliente Activo",
                    clientName: username,
                  )));
    } else if ((random % 20 == 0)) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClientStatusPage(
                    clientStatus: "Cliente Inactivo",
                    clientName: username,
                  )));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClientStatusPage(
                    clientStatus: "Cliente Bloqueado",
                    clientName: username,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inicio",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: clientModel.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () =>
                            goToOtherScreen(getName(clientModel.data[index])),
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(clientModel.data[index].avatar)),
                        title: Text(getName(clientModel.data[index])),
                        subtitle: getEmailLink(clientModel.data[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.grey,
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _clientBlocSubscription.cancel();
  }
}
