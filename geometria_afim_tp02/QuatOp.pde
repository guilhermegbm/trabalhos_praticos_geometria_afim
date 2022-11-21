//Classe utilitária com algumas operações de Quatérnions importantes
class QuatOp {


    /*
    Testes:
     
     Quaternion p = new Quaternion(6, 8, 0, 0);
     Quaternion q = new Quaternion(4, 5, 0, 0);
     
     println(quatOp.somaQuatComEscalar(p, 10));
     println(quatOp.multQuatPorEscalar(p, 3));
     println(quatOp.divQuatPorEscalar(p, 2));
     println(quatOp.multQuats(p, q));
     println(quatOp.multQuatsEficiente(p, q));
     println(quatOp.conjugado(p));
     println(quatOp.norma(p));
     println(quatOp.inv(p));
     println(quatOp.multQuats(p, quatOp.inv(p)));
     println("-----------");
     
     Quaternion qRand = quatOp.gerarQuatAleatorio();
     println(qRand);
     Quaternion qRandNormalizado = quatOp.divQuatPorEscalar(qRand, quatOp.norma(qRand));
     println(qRandNormalizado);
     println(quatOp.norma(qRandNormalizado));
     */

    /*
    O método abaixo calcula a multiplicação de quatérnions usando o agoritmo
    tradicional, usando a propriedade da distributividade dos termos assim
    como foi visto em sala de aula. 
    */
    public Quaternion multQuats(Quaternion p, Quaternion q) {
        return new Quaternion
            ( p.sc*q.sc-p.i*q.i-p.j*q.j-p.k*q.k,
            p.sc*q.i+p.i*q.sc+p.j*q.k-p.k*q.j,
            p.sc*q.j+p.j*q.sc+p.k*q.i-p.i*q.k,
            p.sc*q.k+p.k*q.sc+p.i*q.j-p.j*q.i );
    }

    /*
    O algoritmo abaixo computa a multipicação de quatérnions de forma mais eficiente,
    usando apenas oito multiplicações, assim como está descrito no artigo abaixo (pág. 8)
    THE COMPLEXITY OF THE QUATERNION PRODUCT, Howell, T. Lafon, J., TR 75-245, 1975.
    Esse artigo pode ser acessado no link abaixo:
    https://theworld.com/~sweetser/quaternions/ps/cornellcstr75-245.pdf
    */
    public Quaternion multQuatsEficiente(Quaternion p, Quaternion q) {
        float mult1 = (p.sc + p.i) * (q.sc + q.i);
        float mult2 = (p.k - p.j) * (q.j - q.k);
        float mult3 = (p.i - p.sc) * (q.j + q.k);
        float mult4 = (p.j + p.k) * (q.i - q.sc);
        float mult5 = (p.i + p.k) * (q.i + q.j);
        float mult6 = (p.i - p.k) * (q.i - q.j);
        float mult7 = (p.sc + p.j) * (q.sc - q.k);
        float mult8 = (p.sc - p.j) * (q.sc + q.k);

        float scalarValue = mult2 + (-mult5 - mult6 + mult7 + mult8) / 2;
        float iValue = mult1 - (mult5 + mult6 + mult7 + mult8) / 2;
        float jValue = -mult3 + (mult5 - mult6 + mult7 - mult8) / 2;
        float kValue = -mult4 + (mult5 - mult6 - mult7 + mult8) / 2;

        return new Quaternion(scalarValue, iValue, jValue, kValue);
    }

    public Quaternion somaQuatComEscalar(Quaternion q, float a) {
        return new Quaternion(a + q.sc, q.i, q.j, q.k);
    }

    public Quaternion multQuatPorEscalar(Quaternion q, float a) {
        return new Quaternion(a * q.sc, a * q.i, a * q.j, a * q.k);
    }

    public Quaternion divQuatPorEscalar(Quaternion q, float a) {
        return this.multQuatPorEscalar(q, (1 / a));
    }

    public Quaternion conjugado(Quaternion q) {
        return new Quaternion(q.sc, -q.i, -q.j, -q.k);
    }

    public float norma(Quaternion q) {
        return sqrt(pow(q.sc, 2) + pow(q.i, 2) + pow(q.j, 2) + pow(q.k, 2));
    }

    public Quaternion inv(Quaternion q) {
        return this.divQuatPorEscalar(this.conjugado(q), pow(this.norma(q), 2));
    }

    public Quaternion gerarQuatAleatorio() {
        return new Quaternion(random(-1, 1), random(-1, 1), random(-1, 1), random(-1, 1));
    }
}
