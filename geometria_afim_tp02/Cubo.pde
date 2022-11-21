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

    Quaternion u = null;
    Quaternion uInv = null;

    Cubo cuboSLERPFinal = null;

    public Cubo(float tamanhoAresta, float eixoX, float eixoY, float eixoZ, float angulo, boolean computarSLERP) {
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

        if (computarSLERP) {
            this.cuboSLERPFinal = new Cubo(tamanhoAresta, eixoX, eixoY, eixoZ, angulo, false);
            this.cuboSLERPFinal.rotacionarCuboEficiente();
        }
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

    public void drawCuboSLERPFinal() {
        if (this.cuboSLERPFinal != null) {
            this.cuboSLERPFinal.drawCubo();
        }
    }

    public void drawCuboSLERPIntermediario(float t) {
        if (this.cuboSLERPFinal == null) {
            return;
        }

        //Como isso é um cubo, todos os quatérnions tem a mesma norma
        float norma = quatOp.norma(this.ponto0);

        /*Quaternion t0 = quatOp.divQuatPorEscalar(this.ponto5, norma);
         Quaternion t1 = quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto5, norma);
         
         float angulo = acos(quatOp.dotProd(t0, t1));
         println("-----------");
         println(quatOp.norma(t0));
         println(quatOp.norma(t1));
         println(norma);
         println(this.ponto5);
         println(this.cuboSLERPFinal.ponto5);
         println(angulo);
         println(t);
         Quaternion s = quatOp.slerp(t0, t1, t);
         println("slerp:  ");
         println(s);
         println(quatOp.norma(s));
         Quaternion sDenorm = quatOp.multQuatPorEscalar( s, norma);
         println(sDenorm);
         println(quatOp.norma(sDenorm));*/


        Quaternion pontoSlerp0 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto0, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto0, norma), t), norma);
        Quaternion pontoSlerp1 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto1, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto1, norma), t), norma);
        Quaternion pontoSlerp2 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto2, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto2, norma), t), norma);
        Quaternion pontoSlerp3 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto3, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto3, norma), t), norma);
        Quaternion pontoSlerp4 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto4, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto4, norma), t), norma);
        Quaternion pontoSlerp5 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto5, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto5, norma), t), norma);
        Quaternion pontoSlerp6 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto6, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto6, norma), t), norma);
        Quaternion pontoSlerp7 = quatOp.multQuatPorEscalar( quatOp.slerp(quatOp.divQuatPorEscalar(this.ponto7, norma), quatOp.divQuatPorEscalar(this.cuboSLERPFinal.ponto7, norma), t), norma);

        stroke(230, 225, 255);

        /*
        println("************");
         println(pontoSlerp0);
         println(pontoSlerp1);
         println(pontoSlerp2);
         println(pontoSlerp3);
         println(pontoSlerp4);
         println(pontoSlerp5);
         println(pontoSlerp6);
         println(pontoSlerp7);
         */

        line(pontoSlerp0.i, pontoSlerp0.j, pontoSlerp2.i, pontoSlerp2.j);
        line(pontoSlerp2.i, pontoSlerp2.j, pontoSlerp3.i, pontoSlerp3.j);
        line(pontoSlerp3.i, pontoSlerp3.j, pontoSlerp1.i, pontoSlerp1.j);
        line(pontoSlerp1.i, pontoSlerp1.j, pontoSlerp0.i, pontoSlerp0.j);

        line(pontoSlerp4.i, pontoSlerp4.j, pontoSlerp6.i, pontoSlerp6.j);
        line(pontoSlerp6.i, pontoSlerp6.j, pontoSlerp7.i, pontoSlerp7.j);
        line(pontoSlerp7.i, pontoSlerp7.j, pontoSlerp5.i, pontoSlerp5.j);
        line(pontoSlerp5.i, pontoSlerp5.j, pontoSlerp4.i, pontoSlerp4.j);

        line(pontoSlerp0.i, pontoSlerp0.j, pontoSlerp4.i, pontoSlerp4.j);
        line(pontoSlerp2.i, pontoSlerp2.j, pontoSlerp6.i, pontoSlerp6.j);
        line(pontoSlerp3.i, pontoSlerp3.j, pontoSlerp7.i, pontoSlerp7.j);
        line(pontoSlerp1.i, pontoSlerp1.j, pontoSlerp5.i, pontoSlerp5.j);
    }
}
