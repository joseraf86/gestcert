class CertificadosController < ApplicationController
  before_action :set_certificado, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!#, except: [:index, :show]
  before_action :role_required,  except: :serve
  before_action :validacion_sucursal, only: [:edit, :update, :destroy]

  # GET /certificados
  # GET /certificados.json
  def index
    #@certificados = Certificado.all
    @certificados = Certificado.search({n_certificado:     params[:n_certificado],
                                        n_guia_proveedor:  params[:n_guia_proveedor],
                                        n_codigo_producto: params[:n_codigo_producto],
                                        n_colada:          params[:n_colada],
                                        n_orden_compra:    params[:n_orden_compra],
                                        start_date:        params[:start_date],
                                        end_date:          params[:end_date],
                                        sucursal_id:       params[:sucursal_id],
                                        proveedor_id:      params[:proveedor_id]})
    @certificados = @certificados.page(params[:page]).order('fecha_recepcion DESC')

    if params[:sucursal_id].nil?
      @sucursal_id = current_user.sucursal.id
    else
      @sucursal_id = params[:sucursal_id]
    end

    unless params[:proveedor_id].nil?
      @proveedor_id = params[:proveedor_id]
    end
  end

  # GET /certificados/1
  # GET /certificados/1.json
  def show
    @xhr = request.xhr?
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      # other formats
    end
  end

  # GET /certificados/new
  def new
    @certificado = Certificado.new
    6.times { @certificado.coladas.build }
  end

  # GET /certificados/1/edit
  def edit
    6.times { @certificado.coladas.build }
  end

  # POST /certificados
  # POST /certificados.json
  def create
    @certificado = Certificado.new(certificado_params)
    @certificado.system_id = Time.now.strftime '%Y%m%d%H%M%S'
    obtener_coleccion_coladas

    respond_to do |format|
      if @certificado.save
        format.html { redirect_to @certificado, notice: 'El certificado fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @certificado }
      else
        6.times { @certificado.coladas.build }
        format.html { render :new }
        format.json { render json: @certificado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificados/1
  # PATCH/PUT /certificados/1.json
  def update
    obtener_coleccion_coladas
    respond_to do |format|
      if @certificado.update(certificado_params)
        format.html { redirect_to @certificado, notice: 'El certificado fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @certificado }
      else
        6.times { @certificado.coladas.build }
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
      format.html { redirect_to certificados_url,
                    notice: 'El certificado fue eliminado exitosamente.'}
      format.json { head :no_content }
    end
  end

  def serve
    cert = Certificado.find(params[:id])
    if cert.adjunto_content_type != 'application/pdf'
      Prawn::Document.generate("#{Rails.root.to_path}/tmp/#{params[:id]}.pdf",
                             page_layout: :landscape,
                             margin: 0) do |pdf|

        bg = cert.adjunto.path
        pdf.image bg, fit: [790, 700]
      end
      path ="#{Rails.root.to_path}/tmp/#{params[:id]}.pdf"
    else
      path = cert.adjunto.path
    end
    send_file( path,
               disposition: 'inline',
               type: 'application/pdf',
               x_sendfile: true )

  end

  private

    # Impedir a los usuarios con rol deposito editar y eliminar certificados de otra sucursal.
    def validacion_sucursal
      if @certificado.pertence_a_otra_sucursal?(current_user)
        redirect_to root_url, alert: 'No posees permisos para realizar esta operación porque el certificado no pertenece a tu sucursal'
        return
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_certificado
      @certificado = Certificado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificado_params
      params.require(:certificado).permit(:numero_certificado,
                                          :numero_guia_proveedor,
                                          :numero_codigo_producto,
                                          :numero_orden_compra,
                                          :proveedor_id,
                                          :adjunto,
                                          :fecha_recepcion,
                                          :sucursal_id,
                                          coladas_attributes: [:id, :numero, :_destroy])
    end

    def obtener_coleccion_coladas
      @certificado.coleccion_coladas = params['certificado']['coladas_attributes'].collect {|_, v| v['numero']}.reject { |c| c.empty? }
    end
end
