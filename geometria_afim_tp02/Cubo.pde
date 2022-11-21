//Classe responsável por gerenciar as posições dos pontos e o
//desenho das arestas do cubo, além de calcular as rotações
class Cubo {

    Quaternion ponto0 = null;
    Quaternion ponto1 = null;
    Quaternion ponto2 = null;
    Quaternion ponto3 = null;
    Quaternion ponto4 = null;
    Quaternion ponto5 = null;
    Quaternion ponto6 = null;
    Quaternion ponto7 = null;
    
    /*float eixoX;
    float eixoY;
    float eixoZ;
    float angulo;*/
    Quaternion u = null;
    Quaternion uInv = null;

    public Cubo(float tamanhoAresta, float eixoX, float eixoY, float eixoZ, float angulo) {
        this.ponto0 = new Quaternion(0, -tamanhoAresta, -tamanhoAresta, -tamanhoAresta);
        this.ponto1 = new Quaternion(0, -tamanhoAresta, -tamanhoAresta, tamanhoAresta);
        this.ponto2 = new Quaternion(0, tamanhoAresta, -tamanhoAresta, -tamanhoAresta);
        this.ponto3 = new Quaternion(0, tamanhoAresta, -tamanhoAresta, tamanhoAresta);
        this.ponto4 = new Quaternion(0, -tamanhoAresta, tamanhoAresta, -tamanhoAresta);
        this.ponto5 = new Quaternion(0, -tamanhoAresta, tamanhoAresta, tamanhoAresta);
        this.ponto6 = new Quaternion(0, tamanhoAresta, tamanhoAresta, -tamanhoAresta);
        this.ponto7 = new Quaternion(0, tamanhoAresta, tamanhoAresta, tamanhoAresta);
        
        /*this.eixoX = eixoX;
        this.eixoY = eixoY;
        this.eixoZ = eixoZ;
        this.angulo = angulo;*/
        
        /*
        Visando otimizar o processamento, os quatérnions de rotação "u" e "uInv"
        são pré-computados uma única vez no contrutor
        */
        Quaternion u0 = new Quaternion(0, eixoX, eixoY, eixoZ);
        Quaternion u0Normalizado = quatOp.divQuatPorEscalar(u0, quatOp.norma(u0));
        this.u = quatOp.somaQuatComEscalar(quatOp.multQuatPorEscalar(u0Normalizado, sin(angulo)), cos(angulo));
        this.uInv = quatOp.inv(u);
    }

    public void drawCubo() {
        stroke(230, 225, 28);

        line(this.ponto0.i, this.ponto0.j, this.ponto2.i, this.ponto2.j);
        line(this.ponto2.i, this.ponto2.j, this.ponto3.i, this.ponto3.j);
        line(this.ponto3.i, this.ponto3.j, this.ponto1.i, this.ponto1.j);
        line(this.ponto1.i, this.ponto1.j, this.ponto0.i, this.ponto0.j);

        line(this.ponto4.i, this.ponto4.j, this.ponto6.i, this.ponto6.j);
        line(this.ponto6.i, this.ponto6.j, this.ponto7.i, this.ponto7.j);
        line(this.ponto7.i, this.ponto7.j, this.ponto5.i, this.ponto5.j);
        line(this.ponto5.i, this.ponto5.j, this.ponto4.i, this.ponto4.j);

        line(this.ponto0.i, this.ponto0.j, this.ponto4.i, this.ponto4.j);
        line(this.ponto2.i, this.ponto2.j, this.ponto6.i, this.ponto6.j);
        line(this.ponto3.i, this.ponto3.j, this.ponto7.i, this.ponto7.j);
        line(this.ponto1.i, this.ponto1.j, this.ponto5.i, this.ponto5.j);
    }

    /*
    Método responsável por fazer a rotação dos pontos do cubo em torno do eixo descrito
    pelas coordenadas [eixoX, eixoY, eixoZ] e pelo ângulo "2 * angulo" passados 
    como parâmetros do contrutor dessa classe. Visando otimizar o processamento, os
    quatérnions de rotação "u" e "uInv" são pré-computados uma única vez no contrutor
    dessa classe. As multiplicações de quatérnions abaixo são feitas de forma
    tradicional, como vista em sala de aula. Para usar a versão mais eficiente que usa
    apenas oito multiplicações, use o método "rotacionarCuboEficiente" mais abaixo.
    */
    public void rotacionarCubo() {
        this.ponto0 = quatOp.multQuats(quatOp.multQuats(u, this.ponto0), uInv);
        this.ponto1 = quatOp.multQuats(quatOp.multQuats(u, this.ponto1), uInv);
        this.ponto2 = quatOp.multQuats(quatOp.multQuats(u, this.ponto2), uInv);
        this.ponto3 = quatOp.multQuats(quatOp.multQuats(u, this.ponto3), uInv);
        this.ponto4 = quatOp.multQuats(quatOp.multQuats(u, this.ponto4), uInv);
        this.ponto5 = quatOp.multQuats(quatOp.multQuats(u, this.ponto5), uInv);
        this.ponto6 = quatOp.multQuats(quatOp.multQuats(u, this.ponto6), uInv);
        this.ponto7 = quatOp.multQuats(quatOp.multQuats(u, this.ponto7), uInv);
    }
    
    /*
    Método responsável por rotacionar os pontos do cubo, assim como o método acima.
    Porém, esse método faz multiplicações de quatérnions mais eficientemente.
    Vide "QuatOp.multQuatsEficiente" para mais informações
    */
    public void rotacionarCuboEficiente() {
        this.ponto0 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto0), uInv);
        this.ponto1 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto1), uInv);
        this.ponto2 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto2), uInv);
        this.ponto3 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto3), uInv);
        this.ponto4 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto4), uInv);
        this.ponto5 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto5), uInv);
        this.ponto6 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto6), uInv);
        this.ponto7 = quatOp.multQuatsEficiente(quatOp.multQuats(u, this.ponto7), uInv);
    }
}
