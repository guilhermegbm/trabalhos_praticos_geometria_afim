class Quaternion {

    float sc;
    float i;
    float j;
    float k;

    public Quaternion(float sc, float i, float j, float k) {
        this.sc = sc;
        this.i = i;
        this.j = j;
        this.k = k;
    }
    
    public String toString() {
        return this.sc + " + " + this.i + "i + " + this.j + "j + " + this.k + "k";       
    }
}
