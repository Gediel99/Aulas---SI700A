// ignore_for_file: file_names
class JogoDaVelha {
  List<int> tabuleiro = List.filled(9, 0);
  int jogador = 1;

  jogar(int posicao) {
    if (tabuleiro[posicao] == 0) {
      tabuleiro[posicao] = jogador;
      jogador = jogador == 1 ? -1 : 1;
      return true;
    } else {
      return false;
    }
  }

  obterEstadoPosicao(int posicao) {
    if (tabuleiro[posicao] == 1) {
      return 'X';
    } else if (tabuleiro[posicao] == -1) {
      return 'O';
    } else {
      return '';
    }
  }

  reset(){
    tabuleiro = List.filled(9, 0);
    jogador = 1;
  }

  bool verificarVitoria() {
    if (tabuleiro[0] == tabuleiro[1] && tabuleiro[1] == tabuleiro[2] && tabuleiro[0] != 0) {
      return true;
    } else if (tabuleiro[3] == tabuleiro[4] && tabuleiro[4] == tabuleiro[5] && tabuleiro[3] != 0) {
      return true;
    } else if (tabuleiro[6] == tabuleiro[7] && tabuleiro[7] == tabuleiro[8] && tabuleiro[6] != 0) {
      return true;
    } else if (tabuleiro[0] == tabuleiro[3] && tabuleiro[3] == tabuleiro[6] && tabuleiro[0] != 0) {
      return true;
    } else if (tabuleiro[1] == tabuleiro[4] && tabuleiro[4] == tabuleiro[7] && tabuleiro[1] != 0) {
      return true;
    } else if (tabuleiro[2] == tabuleiro[5] && tabuleiro[5] == tabuleiro[8] && tabuleiro[2] != 0) {
      return true;
    } else if (tabuleiro[0] == tabuleiro[4] && tabuleiro[4] == tabuleiro[8] && tabuleiro[0] != 0) {
      return true;
    } else if (tabuleiro[2] == tabuleiro[4] && tabuleiro[4] == tabuleiro[6] && tabuleiro[2] != 0) {
      return true;
    } else {
      return false;
    }
  }

  bool verificarEmpate() {
    for (int i = 0; i < tabuleiro.length; i++) {
      if (tabuleiro[i] == 0) {
        return false;
      }
    }
    return true;
  }

}
