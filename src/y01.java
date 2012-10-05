class World {
    interface Fii {
        public int call(int i);
    }
    interface Fff {
        public Fii call(Fii i);
    }

    public static void main(String[] args) {
        Fii error = new Fii() { public int call(int i) { throw new RuntimeException("SHOULD NEVER BE CALLED"); } };

        Fff fimp =
            new Fff() {
                public Fii call(final Fii partial) {
                    return new Fii() {
                        public int call(int n) {
                            return n == 0 ? 1 : n * partial.call(n-1);
                        }
                    };
                }
            };

        Fii fn = new Fii() {
                public int call(int n) {
                    return 0;
                }
            };

        int result = fn.call(3);

        System.out.println(result);
    }
}
