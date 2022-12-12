MatrizUtils mUtils = new MatrizUtils();
ArvoreHierarquicaPosAbs arvoreHierarquicaPosAbs = null;
ArvoreHierarquicaPosRel arvoreHierarquicaPosRel = null;

int contadorRotacaoSenoide;
void setup() {
    size(600, 600);
    contadorRotacaoSenoide = 0;

    makeTestPosAbs1();
    //makeTestPosAbs2();
    //makeTestPosAbs3();

    //makeTestPosRel1();
    //makeTestPosRel2();
    //makeTestPosRel3();
    //makeTestPosRel4JoeStick();

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
            contadorRotacaoSenoide++;
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

void makeTestPosRel4JoeStick() {
    arvoreHierarquicaPosRel = new ArvoreHierarquicaPosRel(300, 200);

    NodePosRel tronco = arvoreHierarquicaPosRel.getRaiz();

    NodePosRel pescoco = arvoreHierarquicaPosRel.inserirFilho(tronco, 0, -50, "ROTACAO_NORMAL", 0);
    NodePosRel cabeca = arvoreHierarquicaPosRel.inserirFilho(pescoco, -50, -50, "ROTACAO_SENOIDE", PI/64);

    NodePosRel bracoSuperiorEsq = arvoreHierarquicaPosRel.inserirFilho(tronco, -60, 60, "ROTACAO_SENOIDE", -PI/32);
    NodePosRel bracoInferiorEsq = arvoreHierarquicaPosRel.inserirFilho(bracoSuperiorEsq, -75, 0, "ROTACAO_NORMAL", 0);

    NodePosRel bracoSuperiorDir = arvoreHierarquicaPosRel.inserirFilho(tronco, 60, 60, "ROTACAO_SENOIDE", PI/32);
    NodePosRel bracoInferiorDir = arvoreHierarquicaPosRel.inserirFilho(bracoSuperiorDir, 0, 75, "ROTACAO_NORMAL", 0);

    NodePosRel troncoInferior = arvoreHierarquicaPosRel.inserirFilho(tronco, 0, 200, "ROTACAO_SENOIDE", 0);

    NodePosRel pernaSuperiorEsq = arvoreHierarquicaPosRel.inserirFilho(troncoInferior, -60, 60, "ROTACAO_SENOIDE", -PI/32);
    NodePosRel pernainferiorEsq = arvoreHierarquicaPosRel.inserirFilho(pernaSuperiorEsq, -53.033, 53.033, "ROTACAO_SENOIDE", -PI/64);
    NodePosRel peEsq = arvoreHierarquicaPosRel.inserirFilho(pernainferiorEsq, -20, -20, "ROTACAO_NORMAL", 0);

    NodePosRel pernaSuperiorDir = arvoreHierarquicaPosRel.inserirFilho(troncoInferior, 60, 60, "ROTACAO_SENOIDE", PI/32);
    NodePosRel pernainferiorDir = arvoreHierarquicaPosRel.inserirFilho(pernaSuperiorDir, 75, 0, "ROTACAO_SENOIDE", PI/64);
    NodePosRel peDir = arvoreHierarquicaPosRel.inserirFilho(pernainferiorDir, 0, 28.28, "ROTACAO_NORMAL", 0);
}
