import java.util.Scanner;

public class KasirView {
    public void tampilkanInfo(String nama, int harga, int stok) {
        System.out.println("Nama Barang : " + nama);
        System.out.println("Harga Barang : " + harga);
        System.out.println("Stok Barang : " + stok);
    }

    public int mintaJumlahBarang() {
        int qty;
        try (Scanner in = new Scanner(System.in)) {
            System.out.println("Transaksi Pembelian");
            System.out.print("Jumlah barang : ");
            qty = in.nextInt();
        }
        return qty;
    }

    public void tampilkanPembayaran(int total) {
        System.out.println("Jumlah Bayar : " + total);
    }
}
