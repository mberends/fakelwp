# fakeLWP/Simple.pm

sub get( Str $url ) is export
{
    # the temp file highlights the inefficiency of this implementation
    my $filename = '/tmp/fakeLWP_Simple.data';
    getstore( $url, $filename );
    my $document = slurp( $filename );
    unlink( $filename );
    return $document;
}

# TODO: head() # wget --server-response --save-headers

sub getprint( Str $url ) { return getstore( $url, '-' ); }

sub getstore( Str $url, Str $file ) is export
{
    my $output_document = "--output-document=$file";
    my $output_file     = "--output-file=/dev/null";
    my $user_agent_value = "'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.0.6) Gecko/2009011913 Firefox/3.0.6'";
    # Some other popular user agent values:
    # "''";
    my $ua = "--user-agent=$user_agent";
    # also $ua=""; omits the option entirely, letting wget use its own default
    run "wget $output_option $output_file $ua $url";
    # TODO: return response code eg 200
}

# TODO: mirror() # wget 
# TODO: is_success()
# TODO: is_error()


=begin pod

=head1 NAME
fakeLWP - a Perl 6 subset of LWP (Library for Web in Perl)

=head1 METHODS
Exactly the same as 

=head1 SEE ALSO
Perl 5's L<doc:LWP> and L<doc:LWP::Simple>.

=end pod
