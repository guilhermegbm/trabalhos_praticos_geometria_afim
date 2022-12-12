float angulo1 = PI/32;
float[][] matRot1 = {{cos(angulo1), -sin(angulo1)},
    {sin(angulo1), cos(angulo1)}};

float angulo2 = -PI/64;
float[][] matRot2 = {{cos(angulo2), -sin(angulo2)},
    {sin(angulo2), cos(angulo2)}};

MatrizUtils mUtils = new MatrizUtils();
ArvoreHierarquicaPosAbs arvoreHierarquicaPosAbs = null;

void setup() {
    size(600, 600);

    //makeTestPosAbs1();
    //makeTestPosAbs2();
    //makeTestPosAbs3();
    //makeTestPosAbs4();
    makeTestPosAbs5();

    //arvoreHierarquicaPosAbs.printarArvore();
}

void draw() {
    delay(50);
    background(0);

    if (arvoreHierarquicaPosAbs != null) {
        arvoreHierarquicaPosAbs.display();
        arvoreHierarquicaPosAbs.transform();
    }
}

void makeTestPosAbs1() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 300);
    NodePosAbs raiz = arvoreHierarquicaPosAbs.getRaiz();
    NodePosAbs n1 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 300, 400, 0);
    arvoreHierarquicaPosAbs.inserirFilho(n1, 350, 450, 0);
}

void makeTestPosAbs2() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 300);
    NodePosAbs raiz = arvoreHierarquicaPosAbs.getRaiz();
    NodePosAbs n1 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 300, 400, PI/32);
    arvoreHierarquicaPosAbs.inserirFilho(n1, 350, 450, -PI/64);
}

void makeTestPosAbs3() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 300);
    NodePosAbs raiz = arvoreHierarquicaPosAbs.getRaiz();

    NodePosAbs n1 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 100, 100, 0);
    arvoreHierarquicaPosAbs.inserirFilho(n1, 100, 50, PI/100);

    NodePosAbs n2 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 300, 400, PI/32);
    arvoreHierarquicaPosAbs.inserirFilho(n2, 350, 400, 0);
    arvoreHierarquicaPosAbs.inserirFilho(n2, 350, 400, -PI/64);
}

void makeTestPosAbs4() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 200);
    NodePosAbs n1 = arvoreHierarquicaPosAbs.getRaiz();
    NodePosAbs n2 = arvoreHierarquicaPosAbs.inserirFilho(n1, 350, 250, 0);
    NodePosAbs n3 = arvoreHierarquicaPosAbs.inserirFilho(n2, 300, 300, 0);
    NodePosAbs n4 = arvoreHierarquicaPosAbs.inserirFilho(n3, 250, 350, 0);
    NodePosAbs n5 = arvoreHierarquicaPosAbs.inserirFilho(n3, 350, 350, 0);
    NodePosAbs n6 = arvoreHierarquicaPosAbs.inserirFilho(n2, 400, 300, 0);
}

void makeTestPosAbs5() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 200);
    NodePosAbs n1 = arvoreHierarquicaPosAbs.getRaiz();
    NodePosAbs n2 = arvoreHierarquicaPosAbs.inserirFilho(n1, 350, 250, PI/64);
    NodePosAbs n3 = arvoreHierarquicaPosAbs.inserirFilho(n2, 300, 300, -PI/50);
    NodePosAbs n4 = arvoreHierarquicaPosAbs.inserirFilho(n3, 250, 350, PI/128);
    NodePosAbs n5 = arvoreHierarquicaPosAbs.inserirFilho(n3, 350, 350, 0);
    NodePosAbs n6 = arvoreHierarquicaPosAbs.inserirFilho(n2, 400, 300, 0);
}
