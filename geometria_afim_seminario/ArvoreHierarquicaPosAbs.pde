public class ArvoreHierarquicaPosAbs {

    private NodePosAbs raiz;

    public ArvoreHierarquicaPosAbs(float xRaiz, float yRaiz) {
        //Por padrão, a raiz não tem rotação. Tecnicamente, ela até pode
        //ter uma rotação, mas vai ser uma rotação "intruza" e meio estranha
        this.raiz = new NodePosAbs(xRaiz, yRaiz, 0);
    }

    public NodePosAbs getRaiz() {
        return this.raiz;
    }

    public NodePosAbs inserirFilho(NodePosAbs noPai, float xFilho, float yFilho, float anguloRotacaoFilho) {
        NodePosAbs novoFilho = new NodePosAbs(xFilho, yFilho, anguloRotacaoFilho);

        noPai.inserirFilho(novoFilho);

        return novoFilho;
    }

    public void printarArvore() {
        this.printarArvoreRecursivo(this.raiz, 0);
    }

    private void printarArvoreRecursivo(NodePosAbs node, int depth) {
        println(depth + " - " + node.toString());

        for (NodePosAbs filho : node.getFilhos()) {
            this.printarArvoreRecursivo(filho, depth + 1);
        }
    }

    public void display() {
        this.displayRecursivo(this.raiz);
    }

    private void displayRecursivo(NodePosAbs node) {
        float[][] posAbsPai = node.getPosicaoAbsoluta();

        for (NodePosAbs filho : node.getFilhos()) {
            float[][] posAbsFilho = filho.getPosicaoAbsoluta();


            stroke(230, 225, 28);
            strokeWeight(16);
            line(posAbsPai[0][0], posAbsPai[1][0], posAbsFilho[0][0], posAbsFilho[1][0]);

            this.displayRecursivo(filho);
        }

        stroke(0, 0, 255);
        circle(posAbsPai[0][0], posAbsPai[1][0], 5);
    }

    public void transform() {
        this.transformRecursivo(this.raiz, new float[][][]{}, new float[][][]{});
    }

    private void transformRecursivo(NodePosAbs node, float[][][] translacoesAcumuladas, float[][][] rotacoesAcumuladas) {
        float[][] posAbs = node.getPosicaoAbsoluta();
        float[][] matRot = node.getMatrizRotacao();

        float[][][] proximasTranslacoesAcumuladas = (float[][][]) append(translacoesAcumuladas, posAbs);
        float[][][] proximasRotacoesAcumuladas = (float[][][]) append(rotacoesAcumuladas, matRot);

        for (int i = 0; i < proximasTranslacoesAcumuladas.length; i++) {
            float[][] iesimaRotacao = proximasRotacoesAcumuladas[i];
            float[][] iesimaTranslacao = null;

            if (i == 0) { //Se é a 1ª translação, faz a rotação em torno do eixo da raiz
                iesimaTranslacao = this.raiz.getPosicaoAbsoluta();
            } else { //Se não, faz a rotação em torno do eixo anterior na hierarquia
                iesimaTranslacao = proximasTranslacoesAcumuladas[i-1];
            }

            float[][] pontoTransladado = {{posAbs[0][0]-iesimaTranslacao[0][0]}, {posAbs[1][0]-iesimaTranslacao[1][0]}};

            float[][] pontoRotacionado = mUtils.multiplicarMatrizes(iesimaRotacao, pontoTransladado);

            posAbs = new float[][]{{pontoRotacionado[0][0]+iesimaTranslacao[0][0]}, {pontoRotacionado[1][0]+iesimaTranslacao[1][0]}};
        }

        node.atualizarPosicaoAbsoluta(posAbs[0][0], posAbs[1][0]);

        for (NodePosAbs filho : node.getFilhos()) {
            this.transformRecursivo(filho, proximasTranslacoesAcumuladas, proximasRotacoesAcumuladas);
        }
    }
}
