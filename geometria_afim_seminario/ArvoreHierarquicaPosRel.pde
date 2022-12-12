public class ArvoreHierarquicaPosRel {

    private NodePosRel raiz;

    public ArvoreHierarquicaPosRel(float xRaiz, float yRaiz) {
        //Por padrão, a raiz não tem rotação. Tecnicamente, ela até pode
        //ter uma rotação, mas vai ser uma rotação estranha em torno do eixo absoluto [0, 0]
        this.raiz = new NodePosRel(xRaiz, yRaiz, "ROTACAO_NORMAL", 0);
    }

    public NodePosRel getRaiz() {
        return this.raiz;
    }

    public NodePosRel inserirFilho(NodePosRel noPai, float xFilho, float yFilho, float anguloRotacaoFilho) {
        return this.inserirFilho(noPai, xFilho, yFilho, "ROTACAO_NORMAL", anguloRotacaoFilho);
    }

    public NodePosRel inserirFilho(NodePosRel noPai, float xFilho, float yFilho, String estrategia, float anguloRotacaoFilho) {
        NodePosRel novoFilho = new NodePosRel(xFilho, yFilho, estrategia, anguloRotacaoFilho);

        noPai.inserirFilho(novoFilho);

        return novoFilho;
    }

    public void printarArvore() {
        this.printarArvoreRecursivo(this.raiz, 0);
    }

    private void printarArvoreRecursivo(NodePosRel node, int depth) {
        println(depth + " - " + node.toString());

        for (NodePosRel filho : node.getFilhos()) {
            this.printarArvoreRecursivo(filho, depth + 1);
        }
    }

    public void display() {
        this.displayRecursivo(this.raiz, null);
    }

    private void displayRecursivo(NodePosRel node, float[][] posicaoAbsolutaAcumulada) {
        float[][] posRelNode = node.getPosicaoRelativa();

        float[][] proximaPosicaoAbsolutaAcumulada = null;
        if (posicaoAbsolutaAcumulada == null) { // Se for o nodo da raiz, não devemos desenhar a linha
            proximaPosicaoAbsolutaAcumulada = new float[][]{
                {posRelNode[0][0]},
                {posRelNode[1][0]},
                {1}
            };
        } else {
            proximaPosicaoAbsolutaAcumulada = new float[][]{
                {posRelNode[0][0] + posicaoAbsolutaAcumulada[0][0]},
                {posRelNode[1][0] + posicaoAbsolutaAcumulada[1][0]},
                {1}
            };

            stroke(29, 225, 28);
            strokeWeight(16);
            line(posicaoAbsolutaAcumulada[0][0], posicaoAbsolutaAcumulada[1][0], proximaPosicaoAbsolutaAcumulada[0][0], proximaPosicaoAbsolutaAcumulada[1][0]);
        }

        for (NodePosRel filho : node.getFilhos()) {
            this.displayRecursivo(filho, proximaPosicaoAbsolutaAcumulada);
        }

        stroke(255, 0, 0);
        circle(proximaPosicaoAbsolutaAcumulada[0][0], proximaPosicaoAbsolutaAcumulada[1][0], 5);
    }

    public void transform() {
        this.transformRecursivo(this.raiz, new float[][]{
            {1, 0},
            {0, 1}
            });
    }

    private void transformRecursivo(NodePosRel node, float[][] rotAcumulada) {
        float[][] posRel = node.getPosicaoRelativa();
        float[][] matRot = null;

        if ("ROTACAO_NORMAL".equals(node.getEstrategia())) {
            matRot = node.getMatrizRotacao();
        } else if ("ROTACAO_SENOIDE".equals(node.getEstrategia())) {
            float novoAngulo = sin(contadorRotacaoSenoide/10) * node.getAnguloRotacao();
            matRot = new float[][]{
                {cos(novoAngulo), -sin(novoAngulo)},
                {sin(novoAngulo), cos(novoAngulo)},
            };
        }

        float[][] novaRotAcumulada = mUtils.multiplicarMatrizes(rotAcumulada, matRot);

        //Fazendo a rotação com base no eixo [0, 0] do seu próprio plano relativo. Translações não são importantes.
        //A função "displayRecursivo" que se vire pra encontrar a posição absoluta correta no plano real.
        float[][] pontoRotacionado = mUtils.multiplicarMatrizes(novaRotAcumulada, posRel);

        node.atualizarPosicaoRelativa(pontoRotacionado[0][0], pontoRotacionado[1][0]);

        for (NodePosRel filho : node.getFilhos()) {
            this.transformRecursivo(filho, novaRotAcumulada);
        }
    }
}
