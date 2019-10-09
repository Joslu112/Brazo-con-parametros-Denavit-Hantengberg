function Imprimir_3_ejes()
line([-8 8],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-8 8],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-8 8],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
end