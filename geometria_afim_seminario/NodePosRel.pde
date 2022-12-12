public class NodePosRel {

    //Vetor coluna de dimensões [2, 1] que armazena as coordenadas relativas do ponto que esse nodo representa no seu próprio sistema de coordenadas
    private float[][] posicaoRelativa;

    private NodePosRel[] filhos = {};

    private float anguloRotacao;
    float[][] matRotTransHomog = null;

    public NodePosRel(float x, float y, float anguloRotacao) {
        this.posicaoRelativa = new float[][]{
            {x},
            {y},
            {1}
        };

        this.anguloRotacao = anguloRotacao;
        this.matRotTransHomog = new float[][]{
            {cos(anguloRotacao), -sin(anguloRotacao), 0},
            {sin(anguloRotacao), cos(anguloRotacao), 0},
            {0, 0, 1}
        };
    }

    public void atualizarPosicaoRelativa(float novoX, float novoY) {
        this.posicaoRelativa[0][0] = novoX;
        this.posicaoRelativa[1][0] = novoY;
        
        //this.matRotTransHomog[0][2] = novoX;
        //this.matRotTransHomog[1][2] = novoY;
    }

    public float[][] getPosicaoRelativa() {
        return this.posicaoRelativa;
    }

    public float[][] getMatrizRotacaoTranslacaoHomogeneizada() {
        return this.matRotTransHomog;
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
