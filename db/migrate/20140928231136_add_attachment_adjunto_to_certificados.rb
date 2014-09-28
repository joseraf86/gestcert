class AddAttachmentAdjuntoToCertificados < ActiveRecord::Migration
  def self.up
    change_table :certificados do |t|
      t.attachment :adjunto
    end
  end

  def self.down
    remove_attachment :certificados, :adjunto
  end
end
