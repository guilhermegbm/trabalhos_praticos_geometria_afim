//                                        TP 02 Geometria Afim
//Gabriel Nunes Mendes - 2017021177
//Guilherme Barboza Mendonça - 2019006655

QuatOp quatOp = new QuatOp();

//String que configura os modos de execução: "ROTACAO_ITERATIVA" ou "SLERP"
String modo = null;

//        Variáveis usadas na rotação iterativa do cubo
//Ângulo pelo qual a rotação dos pontos será feita
float angulo = PI/50;

//Eixo pelo qual a rotação dos pontos será feita
//OBS: Como o eixo de rotação é tridimensional, não é possível pegar
//e configurar dinamicamente o eixo a partir do "click" do usuário
//(a não ser que uma das coordenadas fosse jogada fora ou gerada
//aleatoriamente...). Outra possível opção seria usar GUIs personalizadas,
//porém, essas funcionalidades do processing.js só existem com o uso
//de bibliotecas e códigos de terceiros, o que envolveria downloads e
//configurações que complicariam a compilação, execução e teste do
//código, logo, decidimos por manter uma geração aleatória dos eixos
//durante a inicialização do algorítmo
float eixoX = 0.0;
float eixoY = 0.0;
float eixoZ = 0.0;

Cubo cubo = null;

void setup() {
    size(600, 600);
    stroke(255);

    this.configurarRotacaoIterativa();
}

void configurarRotacaoIterativa() {
    this.modo = "ROTACAO_ITERATIVA";

    this.eixoX = random(-1, 1);
    this.eixoY = random(-1, 1);
    this.eixoZ = random(-1, 1);

    float tamanhoAresta = 100;
    this.cubo = new Cubo(tamanhoAresta, this.eixoX, this.eixoY, this.eixoZ, this.angulo);
}

void draw() {
    //Em processing.js, o eixo y é invertido ("cresce pra baixo", em vez de "pra cima")
    //e a origem real do plano fica no canto superior esquerdo da tela. As duas linhas
    //abaixo invertem esse eixo e recentralizam a origem do plano no meio da tela!
    scale(1, -1);
    translate(width/2, -height/2);

    delay(50);
    background(0);

    if ("ROTACAO_ITERATIVA".equals(this.modo)) {
        this.cubo.drawCubo();

        //this.cubo.rotacionarCubo();
        this.cubo.rotacionarCuboEficiente();
    }
}
