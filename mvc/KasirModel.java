public class KasirModel {
    private String nama;
    private int harga;
    private int stok;

    public KasirModel(String nama, int harga, int stok) {
        this.nama = nama;
        this.harga = harga;
        this.stok = stok;
    }

    public String getNama() {
        return nama;
    }

    public int getHarga() {
        return harga;
    }

    public int getStok() {
        return stok;
    }

    public void updateStok(int qty) {
        stok -= qty;
    }

    public int calculateTotal(int qty) {
        return qty * harga;
    }
}
