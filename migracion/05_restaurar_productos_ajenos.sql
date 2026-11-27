-- PIQUINS: RESTAURAR PRODUCTOS AJENOS SI FUERA NECESARIO.
-- No afecta los 175 productos correctos ni borra filas.
BEGIN;
INSERT INTO public.piquins_productos
  (codigo,nombre,descripcion,categoria,precio,imagen,video,destacado,activo,creado_en)
SELECT codigo,nombre,descripcion,categoria,precio,imagen,video,destacado,activo,creado_en
FROM public.piquins_respaldo_ajenos_20261127
ON CONFLICT (codigo) DO NOTHING;
COMMIT;
