class CertificadosController < ApplicationController
  before_action :set_certificado, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!#, except: [:index, :show]
  before_action :role_required#,  except: [:index, :show]

  # GET /certificados
  # GET /certificados.json
  def index
    @certificados = Certificado.search({n_certificado:     params[:n_certificado],
                                        n_guia_proveedor:  params[:n_guia_proveedor],
                                        n_codigo_producto: params[:n_codigo_producto],
                                        n_colada:          params[:n_colada],
                                        n_orden_compra:    params[:n_orden_compra],
                                        start_date:        params[:start_date],
                                        end_date:          params[:end_date]}).order(fecha_recepcion: :desc)
    #@certificados = Certificado.all
  end

  # GET /certificados/1
  # GET /certificados/1.json
  def show
  end

  # GET /certificados/new
  def new
    @certificado = Certificado.new
  end

  # GET /certificados/1/edit
  def edit
  end

  # POST /certificados
  # POST /certificados.json
  def create
    @certificado = Certificado.new(certificado_params)

    respond_to do |format|
      if @certificado.save
        format.html { redirect_to @certificado, notice: 'El certificado fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @certificado }
      else
        format.html { render :new }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificados/1
  # PATCH/PUT /certificados/1.json
  def update
    respond_to do |format|
      if @certificado.update(certificado_params)
        format.html { redirect_to @certificado, notice: 'El certificado fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @certificado }
      else
        format.html { render :edit }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificados/1
  # DELETE /certificados/1.json
  def destroy
    @certificado.destroy
    respond_to do |format|
      format.html { 
           redirect_to certificados_url, 
           notice: 'El certificado fue eliminado exitosamente.'
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificado
      @certificado = Certificado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificado_params
      params.require(:certificado).permit(:numero_certificado, :numero_guia_proveedor, :numero_codigo_producto, :numero_colada, :numero_orden_compra, :proveedor_id, :adjunto, :fecha_recepcion)
    end
end
