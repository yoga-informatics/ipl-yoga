public class KasirController {
    private KasirModel model;
    private KasirView view;

    public KasirController(KasirModel model, KasirView view) {
        this.model = model;
        this.view = view;
    }

    public void jalankanProgram() {
        view.tampilkanInfo(model.getNama(), model.getHarga(), model.getStok());
        int qty = view.mintaJumlahBarang();
        model.updateStok(qty);
        int total = model.calculateTotal(qty);
        view.tampilkanPembayaran(total);
        view.tampilkanInfo(model.getNama(), model.getHarga(), model.getStok());
    }

    public static void main(String[] args) {
        KasirModel model = new KasirModel("GeForce GTX 1060Ti", 3000, 10);
        KasirView view = new KasirView();
        KasirController controller = new KasirController(model, view);
        controller.jalankanProgram();
    }
}
