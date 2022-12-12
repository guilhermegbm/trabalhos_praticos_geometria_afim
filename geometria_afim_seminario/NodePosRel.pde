public class NodePosRel {

    //Vetor coluna de dimensões [2, 1] que armazena as coordenadas relativas do ponto que esse nodo representa no seu próprio sistema de coordenadas
    private float[][] posicaoRelativa;

    private NodePosRel[] filhos = {};

    private float anguloRotacao;
    float[][] matRot = null;

    public NodePosRel(float x, float y, float anguloRotacao) {
        this.posicaoRelativa = new float[][]{
            {x},
            {y}
        };

        this.anguloRotacao = anguloRotacao;
        this.matRot = new float[][]{
            {cos(anguloRotacao), -sin(anguloRotacao)},
            {sin(anguloRotacao), cos(anguloRotacao)},
        };
    }

    public void atualizarPosicaoRelativa(float novoX, float novoY) {
        this.posicaoRelativa[0][0] = novoX;
        this.posicaoRelativa[1][0] = novoY;
    }

    public float[][] getPosicaoRelativa() {
        return this.posicaoRelativa;
    }

    public float[][] getMatrizRotacao() {
        return this.matRot;
    }

    public NodePosRel[] getFilhos() {
        return this.filhos;
    }

    public void inserirFilho(NodePosRel novoFilho) {
        this.filhos = (NodePosRel[]) append(this.filhos, novoFilho);
    }

    public String toString() {
        return "[" + this.posicaoRelativa[0][0] + ", " + this.posicaoRelativa[1][0] + "]";
    }
}
