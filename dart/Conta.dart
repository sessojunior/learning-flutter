import 'dart:math';

class Conta {
  String nome = "Mario Junior";
  int numeroConta = Random().nextInt(9999);
  double _saldo = 0.0;

  get saldo => this._saldo;

  void depositar(double valor) {
    this._saldo += valor;
  }

  void sacar(double valor) {
    this._saldo -= valor;
  }
}