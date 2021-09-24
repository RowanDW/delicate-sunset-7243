class ManifestEntriesController < ApplicationController

  def destroy
    manifest = ManifestEntry.find(params[:id])
    manifest.destroy
    redirect_to flights_path
  end
end
