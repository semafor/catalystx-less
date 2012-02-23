package TestApp::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => q{});

sub base : Chained('/') PathPart('') CaptureArgs(0) {}

# your actions replace this one
sub main : Chained('base') PathPart('') Args(0) {
    my ($self, $ctx) = @_;
    my $url = $ctx->uri_for_combined_less('base.less', 'fonts.less');
    $ctx->res->body('<link href="' . $url . '" rel="stylesheet"></link><h1>It works</h1>');
}

__PACKAGE__->meta->make_immutable;
