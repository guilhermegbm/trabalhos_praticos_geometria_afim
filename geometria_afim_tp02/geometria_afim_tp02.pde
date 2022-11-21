//                                        TP 02 Geometria Afim
//Gabriel Nunes Mendes - 2017021177
//Guilherme Barboza Mendonça - 2019006655

//Classe auxiliar
QuatOp quatOp = new QuatOp();

//String que configura os modos de execução: "ROTACAO_ITERATIVA" ou "SLERP"
String modo = null;

//String auxiliar que mostra o modo atual
String textoModo = "";

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

//Cubo da Rotação Iterativa
Cubo cubo = null;

float contadorSLERP = 0;
Quaternion slerpP = null;
Quaternion slerpQ = null;

void setup() {
    size(600, 600);
    stroke(255);

    this.configurarRotacaoIterativa();
    //this.configurarSLERP();
}

void configurarRotacaoIterativa() {
    this.modo = "ROTACAO_ITERATIVA";
    this.textoModo = "Rotação Iterativa (Clique para alternar)";

    this.angulo = PI/50;

    this.eixoX = random(-1, 1);
    this.eixoY = random(-1, 1);
    this.eixoZ = random(-1, 1);

    float tamanhoAresta = 100;
    this.cubo = new Cubo(tamanhoAresta, this.eixoX, this.eixoY, this.eixoZ, this.angulo, false);
}

void configurarSLERP() {
    this.modo = "SLERP";
    this.textoModo = "SLERP (Clique para alternar)";

    this.contadorSLERP = 0;

    this.angulo = random(0, PI);

    this.eixoX = random(-1, 1);
    this.eixoY = random(-1, 1);
    this.eixoZ = random(-1, 1);

    float tamanhoAresta = 100;
    this.cubo = new Cubo(tamanhoAresta, this.eixoX, this.eixoY, this.eixoZ, this.angulo, true);
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
    } else if ("SLERP".equals(this.modo)) {
        this.cubo.drawCubo();
        this.cubo.drawCuboSLERPFinal();
        this.cubo.drawCuboSLERPIntermediario(contadorSLERP);
        if (this.contadorSLERP <= 1) {
            this.contadorSLERP += 0.01;
        }
    }
    
    this.drawTextoModo();
}

//Usamos o evento "mouseClicked" para alternar entre a Rotação Iterativa e o SLERP
void mouseClicked() {
    if ("ROTACAO_ITERATIVA".equals(this.modo)) {
        this.configurarSLERP();
    } else if ("SLERP".equals(this.modo)) {
        this.configurarRotacaoIterativa();
    }
}

void drawTextoModo () {
    scale(1, -1);
    textSize(30);
    fill(0, 408, 612);
    text(this.textoModo, (-width/2)+50, (-height/2)+50);
}
