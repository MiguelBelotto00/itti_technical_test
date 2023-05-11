import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itti_technical_test/bloc/clients/client_event.dart';
import 'package:itti_technical_test/bloc/clients/client_state.dart';
import 'package:itti_technical_test/models/client_model.dart';
import 'package:itti_technical_test/services/client_service.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(ClientState(ClientModel(data: []))) {
    on<GetClientEvent>((event, emit) => _handleGetClient(event, emit));
  }

  void getClientState() {
    var event = GetClientEvent();
    add(event);
  }

  Future<void> _handleGetClient(
      ClientEvent event, Emitter<ClientState> emit) async {
    try {
      var response = await ClientService().getCart();
      emit(ClientState(response));
    } on SocketException catch (ex) {
      emit(ClientState(ClientModel(data: []), message: ex.message));
    } catch (ex) {
      emit(ClientState(ClientModel(data: []), message: ex.toString()));
    }
  }
}
