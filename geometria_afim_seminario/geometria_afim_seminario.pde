float angulo1 = PI/32;
float[][] matRot1 = {{cos(angulo1), -sin(angulo1)},
    {sin(angulo1), cos(angulo1)}};

float angulo2 = -PI/64;
float[][] matRot2 = {{cos(angulo2), -sin(angulo2)},
    {sin(angulo2), cos(angulo2)}};

MatrizUtils mUtils = new MatrizUtils();
ArvoreHierarquicaPosAbs arvoreHierarquicaPosAbs = null;
ArvoreHierarquicaPosRel arvoreHierarquicaPosRel = null;

void setup() {
    size(600, 600);

    //makeTestPosAbs1();
    //makeTestPosAbs2();
    //makeTestPosAbs3();

    //makeTestPosRel1();
    //makeTestPosRel2();
    //makeTestPosRel3();

    //arvoreHierarquicaPosAbs.printarArvore();
    //arvoreHierarquicaPosRel.printarArvore();
}

void draw() {
    delay(50);
    background(0);

    if (arvoreHierarquicaPosAbs != null) {
        arvoreHierarquicaPosAbs.display();
        //arvoreHierarquicaPosAbs.transform();
    } else if (arvoreHierarquicaPosRel != null) {
        arvoreHierarquicaPosRel.display();
        //arvoreHierarquicaPosRel.transform();
    }
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == DOWN) {
            if (arvoreHierarquicaPosAbs != null) {
                arvoreHierarquicaPosAbs.transform();
            } else if (arvoreHierarquicaPosRel != null) {
                arvoreHierarquicaPosRel.transform();
            }
        }
    }
}

void makeTestPosAbs1() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 300);
    NodePosAbs raiz = arvoreHierarquicaPosAbs.getRaiz();
    NodePosAbs n1 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 300, 400, PI/32);
    arvoreHierarquicaPosAbs.inserirFilho(n1, 350, 450, -PI/64);
}

void makeTestPosAbs2() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 300);
    NodePosAbs raiz = arvoreHierarquicaPosAbs.getRaiz();

    NodePosAbs n1 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 100, 100, 0);
    arvoreHierarquicaPosAbs.inserirFilho(n1, 100, 50, PI/100);

    NodePosAbs n2 = arvoreHierarquicaPosAbs.inserirFilho(raiz, 300, 400, PI/32);
    arvoreHierarquicaPosAbs.inserirFilho(n2, 350, 400, 0);
    arvoreHierarquicaPosAbs.inserirFilho(n2, 350, 400, -PI/64);
}

void makeTestPosAbs3() {
    arvoreHierarquicaPosAbs = new ArvoreHierarquicaPosAbs(300, 200);
    NodePosAbs n1 = arvoreHierarquicaPosAbs.getRaiz();
    NodePosAbs n2 = arvoreHierarquicaPosAbs.inserirFilho(n1, 350, 250, PI/64);
    NodePosAbs n3 = arvoreHierarquicaPosAbs.inserirFilho(n2, 300, 300, -PI/50);
    NodePosAbs n4 = arvoreHierarquicaPosAbs.inserirFilho(n3, 250, 350, PI/128);
    NodePosAbs n5 = arvoreHierarquicaPosAbs.inserirFilho(n3, 350, 350, 0);
    NodePosAbs n6 = arvoreHierarquicaPosAbs.inserirFilho(n2, 400, 300, 0);
}

void makeTestPosRel1() {
    arvoreHierarquicaPosRel = new ArvoreHierarquicaPosRel(300, 300);
    NodePosRel raiz = arvoreHierarquicaPosRel.getRaiz();
    NodePosRel n1 = arvoreHierarquicaPosRel.inserirFilho(raiz, 0, 100, PI/32);
    arvoreHierarquicaPosRel.inserirFilho(n1, 50, 50, -PI/64);
}

void makeTestPosRel2() {
    arvoreHierarquicaPosRel = new ArvoreHierarquicaPosRel(300, 300);
    NodePosRel raiz = arvoreHierarquicaPosRel.getRaiz();

    NodePosRel n1 = arvoreHierarquicaPosRel.inserirFilho(raiz, -200, -200, 0);
    arvoreHierarquicaPosRel.inserirFilho(n1, 0, -50, PI/100);

    NodePosRel n2 = arvoreHierarquicaPosRel.inserirFilho(raiz, 0, 100, PI/32);
    arvoreHierarquicaPosRel.inserirFilho(n2, 50, 0, 0);
    arvoreHierarquicaPosRel.inserirFilho(n2, 50, 0, -PI/64);
}

void makeTestPosRel3() {
    arvoreHierarquicaPosRel = new ArvoreHierarquicaPosRel(300, 200);
    NodePosRel n1 = arvoreHierarquicaPosRel.getRaiz();
    NodePosRel n2 = arvoreHierarquicaPosRel.inserirFilho(n1, 50, 50, PI/64);
    NodePosRel n3 = arvoreHierarquicaPosRel.inserirFilho(n2, -50, 50, -PI/50);
    NodePosRel n4 = arvoreHierarquicaPosRel.inserirFilho(n3, -50, 50, PI/128);
    NodePosRel n5 = arvoreHierarquicaPosRel.inserirFilho(n3, 50, 50, 0);
    NodePosRel n6 = arvoreHierarquicaPosRel.inserirFilho(n2, 50, 50, 0);
}
