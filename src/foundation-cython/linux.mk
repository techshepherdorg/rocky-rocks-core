ifeq ($(strip $(VERSION.MAJOR)), 5)
SSLMK = ssl.mk
else
SSLMK =
endif
GOBJECT =
# include $(GOBOJECT) pygobject.mk pygtk.mk M2Crypto.mk $(SSLMK) numpy.mk pycairo.mk
# include pygobject.mk pygtk.mk M2Crypto.mk $(SSLMK) numpy.mk pycairo.mk
