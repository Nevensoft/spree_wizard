require 'spree/backend/action_callbacks'

module Spree
  module Admin
    class WizardsController < ResourceController
      # all CRUD behavior is inherited from Spree::ResourceController
      
      # copied from spree 2-0-stable
      # https://github.com/spree/spree/blob/b691ddfe5c41a21a308c2cb0472c046c35ba9b8f/backend/app/controllers/spree/admin/resource_controller.rb#L26
      def update
        invoke_callbacks(:update, :before)
        if @object.update_attributes(params[object_name])
          invoke_callbacks(:update, :after)
          flash[:success] = flash_message_for(@object, :successfully_updated)
          respond_with(@object) do |format|
            format.html { redirect_to location_after_save }
            format.js   { render :layout => false }
          end
        else
          invoke_callbacks(:update, :fails)
          # respond_with(@object)
          render action: :edit
        end
      end
      
      def add_taxon
        # variable used to separate multiple new wizard_taxons in HTML name attribute
        # TODO -- totally open to doing this a better way
        @time_stamp = Time.now.to_i.to_s
      end
      
    end
  end
end

