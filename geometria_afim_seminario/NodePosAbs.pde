public class NodePosAbs {

    //Vetor coluna de dimensões [2, 1] que armazena as coordenadas absolutas no plano real do ponto que esse nodo representa
    private float[][] posicaoAbsoluta;

    private NodePosAbs[] filhos = {};

    private float anguloRotacao;
    float[][] matRot = null;

    public NodePosAbs(float x, float y, float anguloRotacao) {
        this.posicaoAbsoluta = new float[][]{
            {x},
            {y}
        };

        this.anguloRotacao = anguloRotacao;
        this.matRot = new float[][]{
            {cos(anguloRotacao), -sin(anguloRotacao)},
            {sin(anguloRotacao), cos(anguloRotacao)}
        };
    }

    public void atualizarPosicaoAbsoluta(float novoX, float novoY) {
        this.posicaoAbsoluta[0][0] = novoX;
        this.posicaoAbsoluta[1][0] = novoY;
    }

    public float[][] getPosicaoAbsoluta() {
        return this.posicaoAbsoluta;
    }

    public float[][] getMatrizRotacao() {
        return this.matRot;
    }

    public NodePosAbs[] getFilhos() {
        return this.filhos;
    }

    public void inserirFilho(NodePosAbs novoFilho) {
        this.filhos = (NodePosAbs[]) append(this.filhos, novoFilho);
    }

    public String toString() {
        return "[" + this.posicaoAbsoluta[0][0] + ", " + this.posicaoAbsoluta[1][0] + "]";
    }
}
