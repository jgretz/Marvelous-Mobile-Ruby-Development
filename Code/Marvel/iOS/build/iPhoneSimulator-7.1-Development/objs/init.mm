extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_3790974F6CC4453387479C658FE3E873(void *, void *);
void MREP_9B0636CB04104B5EAD0DF479EC29E798(void *, void *);
void MREP_0C4B710A3D864046B6B95D266EAF87E7(void *, void *);
void MREP_CD34F1C3C1C3424D9B3FA6FF19AC6BF5(void *, void *);
void MREP_387115CC5BE64A7B912BA8E44CDFD69F(void *, void *);
void MREP_52931ED94D8046DFA4D81D0A19467375(void *, void *);
void MREP_2C1F38B38BD64566BDE3D2AD408B244A(void *, void *);
void MREP_EA29EF2534284F259982A00F66523A66(void *, void *);
void MREP_57FC636AEC78454A846C043BBCDF63F3(void *, void *);
void MREP_2808F6DB4F014BD29C02F1ED7690F687(void *, void *);
void MREP_473C5E6D103C46A38B838D4AE7C2150C(void *, void *);
void MREP_0AB1B3AC55124B628E0F34D77017E69C(void *, void *);
void MREP_720072DA832144A8AD2129E602D8476C(void *, void *);
void MREP_0286273A007B42CEA1250332CDC4326B(void *, void *);
void MREP_441691F5BA7642C592318B53E9B2FEAE(void *, void *);
void MREP_0F604CA3D0074103BC9AE26E07A1B0B5(void *, void *);
void MREP_BDDAD0DE0A604F1BA739A4664D3F901C(void *, void *);
void MREP_38415E4A2F234881ADF36E733211489D(void *, void *);
void MREP_0F633CCD36BA43F1AB895F5B1E580DAD(void *, void *);
void MREP_CCE923ACC44B40548DB569AB2B5CC7E0(void *, void *);
void MREP_D10362A056F24CABAC313F124189E2BE(void *, void *);
void MREP_494FB23F45304642A49B73BFB5B3FDC0(void *, void *);
void MREP_70CA23570A8A438FB1A622024E7009E6(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"2.31");
MREP_3790974F6CC4453387479C658FE3E873(self, 0);
MREP_9B0636CB04104B5EAD0DF479EC29E798(self, 0);
MREP_0C4B710A3D864046B6B95D266EAF87E7(self, 0);
MREP_CD34F1C3C1C3424D9B3FA6FF19AC6BF5(self, 0);
MREP_387115CC5BE64A7B912BA8E44CDFD69F(self, 0);
MREP_52931ED94D8046DFA4D81D0A19467375(self, 0);
MREP_2C1F38B38BD64566BDE3D2AD408B244A(self, 0);
MREP_EA29EF2534284F259982A00F66523A66(self, 0);
MREP_57FC636AEC78454A846C043BBCDF63F3(self, 0);
MREP_2808F6DB4F014BD29C02F1ED7690F687(self, 0);
MREP_473C5E6D103C46A38B838D4AE7C2150C(self, 0);
MREP_0AB1B3AC55124B628E0F34D77017E69C(self, 0);
MREP_720072DA832144A8AD2129E602D8476C(self, 0);
MREP_0286273A007B42CEA1250332CDC4326B(self, 0);
MREP_441691F5BA7642C592318B53E9B2FEAE(self, 0);
MREP_0F604CA3D0074103BC9AE26E07A1B0B5(self, 0);
MREP_BDDAD0DE0A604F1BA739A4664D3F901C(self, 0);
MREP_38415E4A2F234881ADF36E733211489D(self, 0);
MREP_0F633CCD36BA43F1AB895F5B1E580DAD(self, 0);
MREP_CCE923ACC44B40548DB569AB2B5CC7E0(self, 0);
MREP_D10362A056F24CABAC313F124189E2BE(self, 0);
MREP_494FB23F45304642A49B73BFB5B3FDC0(self, 0);
MREP_70CA23570A8A438FB1A622024E7009E6(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
