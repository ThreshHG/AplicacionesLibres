<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Aplicaciones Libres</title>
		<link rel="shortcut icon" href="curza.png">
		<style type="text/css">
			html,body{min-width: 100%; height: 100%; padding: 0px; margin: 0px;background: #FFF;letter-spacing: 0.5pt;}

			#cuerpo{min-width:100%;position: relative;min-height: 100%;height: auto !important;height: auto;}

			#cuerpo #cabecera{padding: 1rem 0;width: 100%;text-align: center;background: #2E86C1;overflow: auto;}
			#cuerpo #cabecera .titulo1{padding: 1rem 0;border-bottom: 1px solid #fff;width: 90%;margin: 0 auto;overflow: auto;}
			#cuerpo #cabecera .titulo1 .titulo1_1{float: left;}
			#cuerpo #cabecera .titulo1 .titulo1_1 img{width: 100px;}
			#cuerpo #cabecera .titulo1 .titulo1_2{float: right;font-size: 3rem;color: #fff;margin-top: 25px;}
			#cuerpo #cabecera .titulo2{font-size: 1rem;color: #fff;padding: 1rem 0;margin-left: 65px;float: left;}
			#cuerpo #cabecera .titulo3{font-size: 1rem;color: #fff;padding: 1rem 0;margin-right: 65px;float: right;}

			#cuerpo #centro{width: 100%;height: 100%;}
			#cuerpo #centro .impresion {width: 80%;margin: 0 auto;padding: 20px 0;}
			#cuerpo #centro .impresion .a{padding: 5px 10px;}

			#cuerpo #pie{position: absolute;bottom: 0 !important;width: 100%;background: #181818;padding: 20px 0;}
		</style>
	</head>
	<body>
		<div id="cuerpo">
			<div id="cabecera">
				<div class="titulo1">
					<div class="titulo1_1">
						<img src="curza.png">
					</div>					
					<div class="titulo1_2">
						Aplicaciones Libres
					</div>
				</div>
				<div class="titulo2">Tecnicatura en Administración de Sistemas y Software Libre</div>
				<div class="titulo3">Grupo: Gabriel - Marcos - Gaspar - Diego</div>
			</div>			
			<div id="centro">
				<div class="impresion">
					<?php
					$ruta="./mis_archivos";
				    if (is_dir($ruta)){
				        // Abre un gestor de directorios para la ruta indicada
				        $gestor = opendir($ruta);

				        // Recorre todos los elementos del directorio
				        while (($archivo = readdir($gestor)) !== false)  {
				                
				            $ruta_completa = $ruta . "/" . $archivo;

				            // Se muestran todos los archivos y carpetas excepto "." y ".."
				            if ($archivo != "." && $archivo != "..") {
				                // Si es un directorio se recorre recursivamente

					?>
									<div class="a">
										<a href="<?php echo $ruta . "/" . $archivo ?>" target="_blank"><?php echo $archivo ?></a>
									</div>
					<?php				      
				                
				            }
				        }
				        
				        // Cierra el gestor de directorios
				        closedir($gestor);
				    } else {
				    ?>
				        <p>La ruta del directorio no existe<p/>
				    <?php
				    }
					?>
				</div>
			</div>
			<div id="pie">
				
			</div>		
		</div>
	</body>
</html>