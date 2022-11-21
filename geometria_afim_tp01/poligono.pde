/*Classe que representa um polígno a ser construido no plano.
Instâncias dessa classe armazenam um conjunto de pontos desse polígono (não necessariamente 
convexo) e permitem adicionar novos pontos dinamicamente e rotacionar tais pontos*/ 
class Poligono {
 
  float[][] pontos = {};
  MatrizUtils mUtils;
  
  public Poligono() {
    mUtils = new MatrizUtils();
  }

  /*Para simplificar as operações nessa classe, as coordenadas dos pontos são dinamicamente
  armazenadas em uma matriz de pontos flutuantes. Essa matriz tem m linhas e 2 colunas,
  onde m é o número de pontos no polígono. Toda vez que um novo ponto é adicionado, uma
  nova linha nessa matriz é criada para armazenar as suas coordenadas x e y*/
  public void adicionarPonto(float x, float y) {
    float[] novoPonto = {x, y};
    pontos = (float[][]) append(pontos, novoPonto);
  }

  /*O display ou "desenho" do polígono no canvas é feito seguindo a ordem dos pontos
  adicionados, de tal forma que constrói-se uma linha do ponto n até o n+1, para todos
  os pontos, com exceção do último, que, por sua vez, tem uma linha que segue do último
  até o primeiro. Por essa razão, o polígono só mostrado na tela quando há dois ou mais
  pontos configurados.*/
  public void display () {
    stroke(230, 225, 28);
    
    if (this.pontos.length <= 1) {
      return;
    }
    
    for (int i = 1; i < this.pontos.length; i++) {
      float[] pontoAnterior = this.pontos[i-1];
      float[] pontoAtual = this.pontos[i];
      
      line(pontoAnterior[0], pontoAnterior[1], pontoAtual[0], pontoAtual[1]);
    }
    
    float[] primeiroPonto = this.pontos[0];
    float[] ultimoPonto = this.pontos[this.pontos.length-1];
    
    line(primeiroPonto[0], primeiroPonto[1], ultimoPonto[0], ultimoPonto[1]);
  }
  
  /*
  A rotação dos pontos do polígono é feita ao redor de um eixo específico e por um ângulo
  específico. Na prática, a rotação é feita diretamente ao se multiplicar a matriz de pontos
  por uma outra matriz de rotação.
  IMPORTANTE: Para se fazer a rotação, precisamos:
   - Da matriz de rotação "Rot" = 2x2
   - Da matriz de pontos do polígono "P" = mx2
   - Do vetor de translação "t" = 1x2
  
  Antes de aplicar a rotação, transladamos todos os pontos para a origem real do plano (ponto [0, 0])
  ao somar todas as linhas de P por -t, gerando a matriz de pontos transladados "P_t". Após a
  translação, devemos rotacionar os pontos e, para isso, devemos multiplicar a matriz de rotação
  (à esquerda) pela matriz de pontos (à direita), mas isso não poderia ser feito, pois R tem 2 
  colunas, enquanto P_t tem m linhas (com m potencialmente diferente de 2). Logo, devemos antes
  "derrubar" a matriz P_t ao transpô-la, gerando uma matriz 2xm. Após a rotação por multiplicação,
  uma nova matriz rotacionada "P_t_r" com dimensões 2xm é gerada. Devemos, agora "endireitar" a 
  matriz ao transpô-la novamente e, por fim, refazer a translação dos pontos rotacionados para a
  origem definida por t ao simplesmente somar as linhas de P_t_r por +t. Ao final do processo, a
  matriz resultante armazena as novas coordenadas dos pontos rotacionados. 
  */
  public void rotacionar(float[][] rotMat, float[] translacao) {
    if (this.pontos.length <= 1) {
      return;
    }
    
    float[][] pontosTransladados = mUtils.somarVetorNasLinhasDaMatriz(this.pontos, mUtils.multiplicarVetorPorEscalar(translacao, -1));
    
    float[][] pontosRotacionados = mUtils.tranporMatriz(mUtils.multiplicarMatrizes(rotMat, mUtils.tranporMatriz(pontosTransladados))); 
    
    this.pontos = mUtils.somarVetorNasLinhasDaMatriz(pontosRotacionados, translacao);
  }
}
