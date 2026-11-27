-- PIQUINS: REVERTIR MIGRACION, mantiene datos sin borrar productos.
BEGIN;
UPDATE public.piquins_productos p SET
 activo=b.activo, imagen=b.imagen, nombre=b.nombre, categoria=b.categoria,
 precio=b.precio, video=b.video, descripcion=b.descripcion, destacado=b.destacado
FROM public.piquins_respaldo_inventario_20261127 b
WHERE p.id=b.id;
UPDATE public.piquins_productos p SET activo=false
WHERE p.codigo LIKE 'FOTO-%'
AND NOT EXISTS (SELECT 1 FROM public.piquins_respaldo_inventario_20261127 b WHERE b.id=p.id);
COMMIT;
