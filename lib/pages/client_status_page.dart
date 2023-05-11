import 'package:flutter/material.dart';

class ClientStatusPage extends StatefulWidget {
  final String clientStatus;
  final String clientName;
  const ClientStatusPage(
      {super.key, this.clientStatus = "", this.clientName = ""});

  @override
  State<ClientStatusPage> createState() => _ClientStatusPageState();
}

class _ClientStatusPageState extends State<ClientStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(widget.clientName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: "Merriweather")),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          widget.clientStatus,
          style: const TextStyle(
              color: Colors.black, fontSize: 20.0, fontFamily: "Merriweather"),
        ),
      ),
    );
  }
}
