# Use the official Jekyll image as the base image
FROM jekyll/jekyll:latest
# Set the working directory in the container
WORKDIR /srv/jekyll
# Install Node.js and npm (already installed in the jekyll/jekyll image)
RUN apk add --update nodejs npm
# Copy the contents of your Jekyll project to the working directory
COPY . .
# Change permissions for Gemfile.lock
RUN chown -R jekyll:jekyll /srv/jekyll/Gemfile.lock
# Install Jekyll and Node.js dependencies
RUN bundle install
# RUN npm install
# Expose the Jekyll development server port (optional, you can customize the port)
EXPOSE 4000
# Command to run Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4000"]