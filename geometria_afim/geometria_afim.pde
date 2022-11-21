//                                        TP Geometria Afim
//Gabriel Nunes Mendes - 2017021177
//Guilherme Barboza Mendonça - 2019006655

//Objeto usado para armazenar os pontos do polígono
Poligono p;

//Ângulo pelo qual a rotação dos pontos será feita 
float angulo = PI/16;

//Matriz de rotação que será usada para rotacionar o polígono
float[][] matRot = {{cos(angulo), -sin(angulo)},
                    {sin(angulo), cos(angulo)}};

/*Vetor usado para demarcar qual o ponto de origem do plano e,
eventualmente, o eixo da rotação. Na prática, esse vetor é
usado na translação dos pontos antes e depois das rotações*/
float[] translacao;

//Classe utilitária com algumas operações matriciais importantes
MatrizUtils mUtils;

//Método de configuração inicial. Executado apenas uma única vêz no início da execução
void setup() {
  size(1000, 600);
  
  translacao = new float[2];
  translacao[0] = width/2;
  translacao[1] = height/2;
  
  p = new Poligono();
  stroke(255);
  
  mUtils = new MatrizUtils();
}

//Método de "desenho", executado a cada frame a partir do início da execução
void draw() {
  //Em processing.js, o eixo y "cresce pra baixo", de tal forma que a origem
  //real do plano fica no canto superior esquerdo da tela. As duas linhas 
  //abaixo invertem esse eixo!
  scale(1, -1);
  translate(0, -height);
  
  //desenhando o polígono
  background(0);
  p.display();
  
  //Desenhando a origem definida
  displayTranslacao();
}

//Método que desenha um ponto vermelho e uma cruz na origem (atual) do plano 
void displayTranslacao() {
  stroke(255, 0, 0);
  line(translacao[0] - 10, translacao[1], translacao[0] + 10, translacao[1]);
  line(translacao[0], translacao[1] - 10, translacao[0], translacao[1] + 10);
  fill(255, 0, 0);
  ellipse(translacao[0], translacao[1], 5, 5);
}

//Clique com o botão esquerdo para adicionar pontos no polígono
//Clique com o botão direito para redefinir o ponto de origem
void mousePressed() {
  if (mouseButton == LEFT) {
    p.adicionarPonto(mouseX, height - mouseY);
  } else if (mouseButton == RIGHT) {
    translacao[0] = mouseX;
    translacao[1] = height - mouseY; //Devemos fazer "height - ..." pois o eixo y está invertido
  }
}

//Pressione a tecla "seta para a esquerda" para fazer uma rotação por +\theta
//Pressione a tecla "seta para a direita" para fazer uma rotação por -\theta
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.rotacionar(matRot, translacao);
    } else if (keyCode == RIGHT) {
      p.rotacionar(mUtils.tranporMatriz(matRot), translacao);
    }
  }
}
